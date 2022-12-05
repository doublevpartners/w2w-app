import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../providers/providers.dart';
import '../theme/app_theme.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.size,
    required this.sp,
  }) : super(key: key);

  final Size size;
  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        await sp.userSignOut();
        Navigator.pushReplacementNamed(context, 'login');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppTheme.primary,
            AppTheme.primary,
            AppTheme.secondary,
            AppTheme.primary,
          ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        child: const AutoSizeText(
          'Login',
          style: TextStyle(color: AppTheme.third, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
