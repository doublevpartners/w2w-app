import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:w2w_app/screens/home_screen.dart';
import 'package:w2w_app/utils/next_screen.dart';

import '../theme/app_theme.dart';

class FloatingButtonHome extends StatelessWidget {
  const FloatingButtonHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: size.width * 0.15,
      height: size.height * 0.11,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // authService.logout();
          // Navigator.pushReplacementNamed(context, 'login');
          nextScreenReplace(context, const HomeScreen());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [AppTheme.primary, AppTheme.secondary]),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/home_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
