import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class CardContainerRegister extends StatelessWidget {
  final Widget child;
  const CardContainerRegister({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      padding: EdgeInsets.only(
        left: size.width * 0.02,
        right: size.width * 0.02,
      ),
      child: child,
    );
  }

  BoxDecoration _createCardShape() => const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppTheme.third)));
}
