import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'ui/theme/theme.dart';
import 'utils/routes.dart';
import 'ui/pages/pages.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(ExpoApp());
}

class ExpoApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HVL Expo',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      theme: ExpoTheme.primaryTheme,
      routes: {
        Routes.main: (context) => MainPage(title: 'HVL Expo'),
        Routes.scan: (context) => ScannerPage(cameras: cameras),
      },
      initialRoute: Routes.main,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    // Log the current screen to Analytics whenever the state is initialized
    _setCurrentScreen();
  }

  /// Increments the counter variable and logs the value to Analytics
  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await widget.analytics.logEvent(
        name: 'increment_counter',
        parameters: <String, dynamic>{'counter': _counter});
  }

  /// Logs the current screen to [analytics]
  Future<void> _setCurrentScreen() async {
    await widget.analytics.setCurrentScreen(
        screenName: 'Counter Screen', screenClassOverride: 'CounterScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
