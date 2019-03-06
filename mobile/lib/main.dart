import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'ui/theme/theme.dart';
import 'utils/routes.dart';
import 'ui/pages/pages.dart';
import 'package:local_auth/local_auth.dart';
import 'package:hvl_expo/utils/lifecycle_handler.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(ExpoApp());
}

class ExpoApp extends StatefulWidget {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  ExpoAppState createState() => ExpoAppState();
}

class ExpoAppState extends State<ExpoApp> {
  bool _authenticated = false;

  Future<Null> _authenticate() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    bool canUseBiometrics = await LocalAuthentication().canCheckBiometrics;

    if (user == null) {
      setState(() {
        _authenticated = false;
      });
      return;
    } else if (canUseBiometrics){
      _authenticateBiometric();
    } else if (user != null) {
      setState(() {
       _authenticated = true; 
      });
    }
  }

  Future<Null> _authenticateBiometric() async {
    bool authenticated = false;

    authenticated = await LocalAuthentication().authenticateWithBiometrics(
        localizedReason: 'Please authenticate to access the app',
        useErrorDialogs: true,
        stickyAuth: true);

    if (mounted) {
      setState(() {
        _authenticated = authenticated;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
        resumeCallBack: _authenticate, suspendingCallBack: _authenticate));
  }

  @override
  void didChangeDependencies() {
    if (!_authenticated) {
      _authenticate();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HVL Expo',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [widget.routeObserver],
        theme: ExpoTheme.primaryTheme,
        routes: {
          Routes.main: (context) => MainPage(title: 'HVL Expo',),
          Routes.auth: (context) => AuthPage(onAuthenticated: _authenticate,),
          Routes.scan: (context) => ScannerPage(cameras: cameras),
        },
        home: !_authenticated ? AuthPage(onAuthenticated: _authenticate,) : MainPage(title: 'HVL Expo'));
  }
}
