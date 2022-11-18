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
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: Color.fromARGB(129, 163, 159, 159));
  }
}
