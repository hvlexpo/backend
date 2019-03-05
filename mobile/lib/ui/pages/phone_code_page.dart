import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/theme/theme.dart';
import 'package:hvl_expo/ui/containers/pin_keyboard.dart';
import 'package:hvl_expo/ui/containers/loading_indicator.dart';

class PhoneCodePage extends StatefulWidget {
  PhoneCodePage(this.smsCode, {Key key, this.onCodeEntered}) : super(key: key);

  final String smsCode;
  final StringCallback onCodeEntered;

  @override
  _PhoneCodePageState createState() => _PhoneCodePageState();
}

class _PhoneCodePageState extends State<PhoneCodePage> {
  String _pin = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExpoColors.hvlPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Verification code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Center(
              child: Text(
                _pin,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Center(
            child: PinKeyboard(
              width: 300,
              height: 375,
              onKeyPressed: onKeyPressed,
            ),
          ),
        ],
      ),
    );
  }

  void onKeyPressed(String digit) {
    setState(() {
      _pin = _pin + digit;
    });
    if (_pin.length == 6) {
      widget.onCodeEntered(_pin);
      showDialog(
          context: context,
          builder: (context) {
            return LoadingIndicator();
          });
    }
  }
}
