import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/config/config.dart';
import 'package:w2w_app/providers/sign_in_provider.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/utils/next_screen.dart';

import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => {
              sp.isSignedIn == false
                  ? nextScreenReplace(context, const HomeScreen())
                  : nextScreenReplace(context, const HomeScreen())
            });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/splashScreen.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppTheme.secondary.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: size.height * 0.3,
          ),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Column(children: [
            SvgPicture.asset(
              Config.app_icon,
              width: MediaQuery.of(context).size.width * 0.5,
              semanticsLabel: 'World To Walk',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const AutoSizeText('Se tu Propio Guia',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                )),
            const SizedBox(
              height: 50,
            ),
            const SpinKitCircle(
              color: AppTheme.third,
            ),
          ]),
        ),
      ),
    );
  }
}
