import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/utils/next_screen.dart';

import '../screens/screens.dart';

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () => nextScreenReplace(context, const HomeScreen()),
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.08,
            left: MediaQuery.of(context).size.width * 0.08),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.0,
            vertical: MediaQuery.of(context).size.height * 0.01),
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [AppTheme.primary, AppTheme.secondary]),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/skip_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            const Text(
              'Skip',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
