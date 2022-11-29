import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {String? hintText,
      required String labelText,
      required IconData prefixIcon}) {
    return InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.white,
        size: 30,
      ),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 15, color: Colors.white),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
    );
  }
}
