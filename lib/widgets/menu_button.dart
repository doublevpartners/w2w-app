import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (isOpen == true) {
          Scaffold.of(context).openEndDrawer();
        } else {
          Scaffold.of(context).closeEndDrawer();
        }
      },
      shape: const CircleBorder(),
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppTheme.primary, AppTheme.secondary]),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppTheme.secondary,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(4, 4))
              ]),
          child: SvgPicture.asset(
            'assets/menu_icon.svg',
            fit: BoxFit.scaleDown,
          )),
    );
  }
}
