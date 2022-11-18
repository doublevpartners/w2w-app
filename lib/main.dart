import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/services/services.dart';

import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MyApp(),
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
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'checking': (_) => CheckAuthScreen()
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(36, 56, 114, 1)),
    );
  }
}
