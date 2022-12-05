import 'package:flutter/material.dart';

class NotificationService {
  static late GlobalKey<ScaffoldMessengerState> messegarKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 20)),
    );
    messegarKey.currentState!.showSnackBar(snackBar);
  }
}
