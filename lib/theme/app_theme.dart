import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(36, 56, 114, 1);
  static const Color secondary = Color.fromRGBO(41, 41, 41, 1);
  static const Color third = Color.fromRGBO(255, 255, 255, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    disabledColor: Colors.grey,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      labelStyle: const TextStyle(color: Colors.white),
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
