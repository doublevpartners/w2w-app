import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';
import 'next_screen.dart';

void openSnackBar(context, snackMessage, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    action: SnackBarAction(
      label: 'ok',
      textColor: Colors.white,
      onPressed: () {},
    ),
    content: Text(
      snackMessage,
      style: const TextStyle(fontSize: 14),
    ),
  ));
}
