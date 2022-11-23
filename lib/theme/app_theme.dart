import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(36, 56, 114, 1);
  static const Color secondary = Color.fromRGBO(41, 41, 41, 1);
  static const Color third = Color.fromRGBO(255, 255, 255, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 60,
      ),
      headline2: TextStyle(
        color: secondary,
        fontWeight: FontWeight.w700,
        fontSize: 48,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 36,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 32,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    disabledColor: Colors.grey,
  );
}
