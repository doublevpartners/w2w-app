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
        hintStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: const Color.fromARGB(129, 163, 159, 159));
  }
}
