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
        fontWeight: FontWeight.bold,
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
        fontWeight: FontWeight.w600,
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          color: third, fontSize: 20, fontWeight: FontWeight.w400),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      labelStyle: const TextStyle(color: third),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      filled: true,
      fillColor: const Color.fromARGB(129, 163, 159, 159),
    ),
  );
}
