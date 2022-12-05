import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class CardContainerLogin extends StatelessWidget {
  final Widget child;
  const CardContainerLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      padding: EdgeInsets.only(
          top: size.height * 0.1,
          left: size.width * 0.02,
          right: size.width * 0.02,
          bottom: size.height * 0.02),
      decoration: _createCardShape(),
      child: child,
    );
  }

  BoxDecoration _createCardShape() => const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppTheme.third)));
}
