import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class CardContainerLogin extends StatelessWidget {
  final Widget child;
  const CardContainerLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: _createCardShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppTheme.third)));
}
