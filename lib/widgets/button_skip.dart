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
      disabledColor: Colors.red,
      padding: EdgeInsets.zero,
      onPressed: () {
        print('click');
        Navigator.pushReplacementNamed(context, 'splashscreen');
      },
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.15,
            left: MediaQuery.of(context).size.width * 0.8),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.0,
            vertical: MediaQuery.of(context).size.height * 0.01),
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [AppTheme.primary, AppTheme.secondary]),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            SvgPicture.asset(
              'assets/skip_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
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
