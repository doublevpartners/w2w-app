import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/services/services.dart';

import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'checking',
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'home': (_) => const HomeScreen(),
        'checking': (_) => const CheckAuthScreen()
      },
      scaffoldMessengerKey: NotificationService.messegarKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1)),
    );
  }
}
