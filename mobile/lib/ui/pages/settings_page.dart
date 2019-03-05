import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hvl_expo/utils/routes.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FlatButton(
          child: Text('SMS Code page'),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => PhoneCodePage('Test'))),
        ),
        FlatButton(
          child: Text('Firebase Logout'),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(context, Routes.auth, (Route<dynamic> route) => false);
          },
        ),
      ],
    );
  }
}
