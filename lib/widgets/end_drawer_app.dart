import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/services/auth_services.dart';
import 'package:w2w_app/utils/next_screen.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../providers/providers.dart';
import '../theme/app_theme.dart';

class EndDrawerApp extends StatelessWidget {
  const EndDrawerApp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.6),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.elliptical(130, 77),
          bottomLeft: Radius.circular(300),
          topLeft: Radius.elliptical(120, 200),
        ),
        child: SizedBox(
          width: size.width * 0.75,
          child: Drawer(
            backgroundColor: AppTheme.primary,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              padding: EdgeInsets.only(left: size.width * 0.2),
              child: Column(children: [
                Row(
                  children: [
                    NavigationApp(
                      size: size,
                      text: 'Mi perfil',
                      icon: 'assets/navbar/user.svg',
                      screen: const ProfileScreen(),
                    ),
                    const MenuButton(isOpen: false),
                  ],
                ),
                NavigationApp(
                  size: size,
                  text: 'Histórico de rutas',
                  icon: 'assets/navbar/history.svg',
                  screen: const RouteHistoryScreen(),
                ),
                NavigationApp(
                  size: size,
                  text: 'Favoritos',
                  icon: 'assets/navbar/favorite.svg',
                  screen: const FavouriteScreen(),
                ),
                NavigationApp(
                  size: size,
                  text: 'Notificaciones',
                  icon: 'assets/navbar/notification.svg',
                  screen: const NotificationScreen(),
                ),
                NavigationApp(
                  size: size,
                  text: 'Cerrar sesión',
                  icon: 'assets/navbar/logout.svg',
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    this.screen,
  }) : super(key: key);

  final Size size;
  final String text;
  final String icon;
  final screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          width: size.width * 0.01,
        ),
        MaterialButton(
          onPressed: () {
            if (screen == null) {
              final sp = context.read<SignInProvider>();
              final authService = context.read<AuthService>();
              sp.userSignOut();
              authService.logout();
              Navigator.pushReplacementNamed(context, 'splashscreen');
            } else {
              nextScreen(context, screen);
            }
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: AppTheme.third),
          ),
        )
      ],
    );
  }
}
