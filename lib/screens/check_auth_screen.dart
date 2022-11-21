import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/splashScreen.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Column(
          children: [
            const _BodySplash(),
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
                              pageBuilder: (_, __, ___) => const HomeScreen(),
                              transitionDuration: const Duration(seconds: 0)));
                    });
                  }

                  return Container();
                },
              ),
            ),
          ],
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
        const SizedBox(
          height: 350,
        ),
        SvgPicture.asset(
          'assets/Logo.svg',
          width: 200,
          semanticsLabel: 'World To Walk',
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Se tu Propio Guia',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 100,
        ),
        const CircularProgressIndicator(),
      ],
    );
  }
}
