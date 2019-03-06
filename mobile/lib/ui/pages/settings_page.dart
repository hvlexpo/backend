import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/pages/pages.dart';
import 'package:hvl_expo/ui/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:hvl_expo/ui/containers/loading_indicator.dart';
import 'package:hvl_expo/utils/routes.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  final labelStyle = TextStyle(
      color: ExpoColors.hvlPrimary, fontWeight: FontWeight.w400, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return LoadingIndicator();
              default:
                if (snapshot.hasData) {
                  return Card(
                    elevation: 0.5,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/firebase.png',
                                height: 25),
                            Text(
                              snapshot.data.uid,
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return LoadingIndicator();
                }
            }
          },
        ),
        FlatButton.icon(
          icon: Icon(
            Icons.sms,
            color: ExpoColors.hvlPrimary,
          ),
          label: Text(
            'SMS Code page',
            style: labelStyle,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => PhoneCodePage('Test'))),
        ),
        FlatButton.icon(
          icon: Icon(
            GroovinMaterialIcons.fire,
            color: ExpoColors.hvlPrimary,
          ),
          label: Text(
            'Firebase Logout',
            style: labelStyle,
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.auth, (Route<dynamic> route) => false);
          },
        ),
      ],
    );
  }
}
