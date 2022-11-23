import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      required IconData prefixIcon}) {
    return InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.white,
        size: 30,
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
    );
  }
}
