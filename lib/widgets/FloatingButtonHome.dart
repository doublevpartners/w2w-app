import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FloatingButtonHome extends StatelessWidget {
  const FloatingButtonHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton(
        onPressed: () {
          // authService.logout();
          // Navigator.pushReplacementNamed(context, 'login');
          Navigator.pushReplacementNamed(context, 'home');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary]),
            borderRadius: BorderRadius.circular(55),
          ),
          child: Icon(
            Icons.home_outlined,
            size: size.width * 0.1,
          ),
        ),
      ),
    );
  }
}
