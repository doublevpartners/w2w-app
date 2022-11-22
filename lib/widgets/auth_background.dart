import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBackgroud extends StatelessWidget {
  final Widget child;
  const AuthBackgroud({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        child: Column(children: [
          SvgPicture.asset(
            'assets/Logo.svg',
            width: 100,
            semanticsLabel: 'World To Walk',
            fit: BoxFit.contain,
          ),
          const Text(
            '¡Bienvenido!',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            'Tenemos las mejores\nrutas para ti!',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
