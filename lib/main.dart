import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/cities_provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/services/services.dart';
import 'package:w2w_app/theme/app_theme.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(
          create: (_) => SignInProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
        ChangeNotifierProvider(
          create: (_) => CitiesProvider(),
          lazy: false,
        )
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
      initialRoute: 'splashscreen',
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'home': (_) => const HomeScreen(),
        'checking': (_) => const CheckAuthScreen(),
        'slideshow': (_) => const SlideShowScreen(),
        'splashscreen': (_) => const SplashScreen(),
        'cities': (_) => const CitiesScreen(),
        'onboarding': (_) => const OnboardingScreen(),
      },
      scaffoldMessengerKey: NotificationService.messegarKey,
      theme: AppTheme.lightTheme,
    );
  }
}
