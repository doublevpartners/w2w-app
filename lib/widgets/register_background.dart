import 'package:flutter/material.dart';

import 'header_login.dart';

class RegisterBackground extends StatelessWidget {
  final Widget child;
  const RegisterBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(children: [
        const HeaderLogin(
          header1: 'Crear cuenta',
        ),
        this.child
      ])),
    );
  }
}
