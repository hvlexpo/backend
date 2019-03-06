import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hvl_expo/ui/pages/pages.dart';
import 'package:hvl_expo/ui/theme/theme.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'dart:async';

typedef FutureVoidCallback();

class AuthPage extends StatelessWidget {
  final FutureVoidCallback onAuthenticated;
  AuthPage({
    Key key,
    @required this.onAuthenticated,
  }) : super(key: key);

  final _phoneKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExpoColors.hvlPrimary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: _phoneKey,
                  child: TextFormField(
                    style: TextStyle(color: ExpoColors.hvlAccent, fontSize: 22),
                    decoration: InputDecoration(
                        labelText: 'Phone number',
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 22),
                        prefixText: '+47',
                        prefixStyle: TextStyle(
                            fontSize: 22, color: ExpoColors.hvlAccent)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your phone number';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.send,
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                  ),
                ),
              ),
              FlatButton.icon(
                padding: EdgeInsets.only(top: 20),
                icon: Icon(
                  GroovinMaterialIcons.fire,
                  color: Colors.black.withOpacity(0.4),
                ),
                label: Text(
                  'Debug Login',
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                ),
                onPressed: () async {
                  final user = FirebaseAuth.instance.signInAnonymously();
                  if (user != null) {
                    onAuthenticated();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ExpoColors.hvlAccent,
          foregroundColor: Colors.white,
          label: Text('Sign in'),
          icon: Icon(Icons.send),
          onPressed: () async {
            try {
              final response = await verifyPhone('+47${_phoneController.text}');
              Future.delayed(Duration(milliseconds: 500));
              final user = await FirebaseAuth.instance.currentUser();
              if (user != null) {
                onAuthenticated();
                return;
              }
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PhoneCodePage(response,
                      onCodeEntered: (smsCode) =>
                          onCodeEntered(verId: response, smsCode: smsCode))));
            } catch (e) {
              print(e);
              return;
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<String> verifyPhone(String phoneNumber) async {
    String verificationId;
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
      debugPrint('Code sent');
    };

    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      print('Verified $user');
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) {
      print('Failed');
      print(exception.message);
    };

    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed);

    return verificationId;
  }

  Future<FirebaseUser> signinPhone(String smsCode, String verId) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verId,
      smsCode: smsCode,
    );

    final FirebaseUser firebaseUser =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return firebaseUser;
  }

  void onCodeEntered({String verId, String smsCode}) async {
    final user = await signinPhone(smsCode, verId);
    if (user != null) {
      onAuthenticated();
      return;
    }
  }
}
