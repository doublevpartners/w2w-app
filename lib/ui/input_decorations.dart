import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w2w_app/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration searchInputDecoration(
      {required hintText, String? prefixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: SvgPicture.asset(
        'assets/icons/routes/$prefixIcon',
        fit: BoxFit.scaleDown,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 163, 159, 159)),
      fillColor: const Color.fromARGB(33, 163, 159, 159),
    );
  }

  static InputDecoration authInputDecoration(
      {required hintText,
      String? labelText,
      required String prefixIcon,
      IconButton? suffixIcon}) {
    return InputDecoration(
      errorStyle: TextStyle(color: Color.fromRGBO(255, 88, 88, 1)),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(255, 88, 88, 1),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(255, 88, 88, 1),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      prefixIcon: SvgPicture.asset(
        'assets/icons/signup/$prefixIcon',
        color: AppTheme.third,
        fit: BoxFit.scaleDown,
      ),
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 15, color: Colors.white),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: const Color.fromARGB(129, 163, 159, 159),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
