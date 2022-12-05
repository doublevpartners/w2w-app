import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(bottom: size.height * 0.56),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(250),
          topLeft: Radius.circular(250),
          bottomRight: Radius.circular(40),
        ),
        child: SizedBox(
          width: size.width * 0.75,
          child: Drawer(
            backgroundColor: AppTheme.primary,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.08),
              padding: EdgeInsets.only(left: size.width * 0.2),
              child: Column(children: [
                Row(
                  children: [
                    NavigationApp(
                      size: size,
                      text: 'Mi perfil',
                      icon: Icons.person_outline_outlined,
                      screen: const ProfileScreen(),
                    ),
                    const MenuButton(isOpen: false),
                  ],
                ),
                NavigationApp(
                  size: size,
                  text: 'Histórico de Rutas',
                  icon: Icons.calendar_today_outlined,
                  screen: const RouteHistoryScreen(),
                ),
                NavigationApp(
                  size: size,
                  text: 'Favoritos',
                  icon: Icons.wallet,
                  screen: const FavouriteScreen(),
                ),
                NavigationApp(
                  size: size,
                  text: 'Notificaciones',
                  icon: Icons.notifications_none,
                ),
                NavigationApp(
                  size: size,
                  text: 'Cerrar sesión',
                  icon: Icons.logout,
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
  final IconData icon;
  final screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.third,
        ),
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
