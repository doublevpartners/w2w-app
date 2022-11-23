import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w2w_app/theme/app_theme.dart';

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
            fit: BoxFit.cover,
          ),
          AutoSizeText('¡Bienvenido!',
              style: Theme.of(context).textTheme.headline3),
          AutoSizeText(
            'Tenemos las mejores\nrutas para ti!',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
