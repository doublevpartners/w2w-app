import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static late GlobalKey<ScaffoldMessengerState> messegarKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = new SnackBar(
        content:
            Text(message, style: TextStyle(color: Colors.white, fontSize: 20)));
    messegarKey.currentState!.showSnackBar(snackBar);
  }
}
