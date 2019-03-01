import 'package:flutter/material.dart';

class ExpoTheme {
  static get primaryTheme {
    return ThemeData(
      primaryColor: Color(0xFF176C89),
      accentColor: Color(0xFF00AEBA),
      splashColor: Color(0xFF176C89),
      fontFamily: 'Akademie'
    );
  }

  static final labelStyle = TextStyle(
    color: Colors.black54,
    fontFamily: 'Akademie',
    fontSize: 14,
    fontWeight: FontWeight.w400
  );

  static final titleStyle = TextStyle(
    color: Color(0xFF176C89),
    fontFamily: 'Akademie',
    fontWeight: FontWeight.w500
  );
}