import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/services/services.dart';
import 'package:w2w_app/theme/app_theme.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context, listen: false);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: const _BodySplash(),
              ),
              Center(
                child: FutureBuilder(
                  future: authService.readToken(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('');
                    }

                    if (snapshot.data == '') {
                      Future.microtask(() async {
                        // Navigator.of(context).pushReplacementNamed('home');
                        // * Important
                        // await Future.delayed(const Duration(seconds: 5));

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const LoginScreen(),
                              transitionDuration: const Duration(seconds: 0)),
                        );
                      });
                    } else {
                      Future.microtask(() async {
                        // Navigator.of(context).pushReplacementNamed('home');
                        // * Important
                        // await Future.delayed(const Duration(seconds: 5));

                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const SlideShowScreen(),
                                transitionDuration:
                                    const Duration(seconds: 0)));
                      });
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BodySplash extends StatelessWidget {
  const _BodySplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/Logo.svg',
          width: MediaQuery.of(context).size.width * 0.6,
          semanticsLabel: 'World To Walk',
          fit: BoxFit.contain,
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Column(children: [
            AutoSizeText(
              'Se tu Propio Guia',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 50,
            ),
            const SpinKitCircle(
              color: AppTheme.third,
            ),
          ]),
        )
      ],
    );
  }
}
