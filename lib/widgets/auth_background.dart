import 'package:flutter/material.dart';

import 'header_login.dart';

class AuthBackgroud extends StatelessWidget {
  final Widget child;
  const AuthBackgroud({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(children: [
        const HeaderLogin(
          header1: '¡Bienvenido!',
          header2: 'Tenemos las mejores\nrutas para ti!',
        ),
        this.child
      ])),
    );
  }
}
