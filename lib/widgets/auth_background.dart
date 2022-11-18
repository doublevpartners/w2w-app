import 'package:flutter/material.dart';

class AuthBackgroud extends StatelessWidget {
  final Widget child;
  const AuthBackgroud({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [_HeaderLogin(), this.child]),
    );
  }
}

class _HeaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Column(children: const [
          Icon(
            Icons.person_pin,
            size: 100,
            color: Colors.white,
          ),
          Text(
            '¡Bienvenido!',
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Tenemos las mejores\nrutas para ti!',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
