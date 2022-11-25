import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/theme/app_theme.dart';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          _FloatingButtonStyle(size: size, sp: sp, authService: authService),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/home.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.darken),
                ),
              )),
          const _BodyHome(),
          Positioned(
            top: size.height * 0.8,
            right: size.width * 0,
            child:
                // ignore: todo
                //TODO: sp.isSignedIn == false ? ButtonLogin(size: size) : Container(),
                ButtonLogin(
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyHome extends StatelessWidget {
  const _BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.08,
              child: SvgPicture.asset(
                'assets/home.svg',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.4,
              child: AutoSizeText(
                'World',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.end,
              ),
            ),
            Positioned(
              top: size.height * 0.15,
              left: size.width * 0.4,
              child: Column(
                children: [
                  AutoSizeText(
                    'To Walk',
                    style: Theme.of(context).textTheme.headline1,
                  )
                ],
              ),
            ),
            _SearchInput(size: size),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _ButtonsHome(
                size: size,
                svg: 'assets/home_location.svg',
                text: 'Todas las Rutas',
              ),
              SizedBox(
                width: size.width * 0.35,
              ),
              _ButtonsHome(
                size: size,
                svg: 'assets/home_person.svg',
                text: 'Cerca de ti',
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'login');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppTheme.primary,
            AppTheme.primary,
            AppTheme.secondary,
            AppTheme.primary,
          ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        child: const AutoSizeText(
          'Login',
          style: TextStyle(color: AppTheme.third, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ButtonsHome extends StatelessWidget {
  const _ButtonsHome({
    Key? key,
    required this.size,
    required this.svg,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String svg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.52),
      child: Column(children: [
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 25),
          color: const Color.fromARGB(129, 163, 159, 159),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            svg,
            width: size.width * 0.05,
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        AutoSizeText(
          text,
          style: const TextStyle(fontSize: 18),
        )
      ]),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3, left: size.width * 0.05),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
      width: size.width * 0.9,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.third, width: 2),
        ),
      ),
      child: TextFormField(
        cursorColor: AppTheme.third,
        style: const TextStyle(color: AppTheme.third),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
          hintText: 'Elige tu Ciudad',
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.third,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _FloatingButtonStyle extends StatelessWidget {
  const _FloatingButtonStyle({
    Key? key,
    required this.size,
    required this.authService,
    required this.sp,
  }) : super(key: key);

  final Size size;
  final SignInProvider sp;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.2,
      child: FloatingActionButton(
        onPressed: () {
          // authService.logout();
          // Navigator.pushReplacementNamed(context, 'login');
          sp.userSignOut();
          Navigator.pushReplacementNamed(context, 'login');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary]),
            borderRadius: BorderRadius.circular(55),
          ),
          child: const Icon(
            Icons.home_outlined,
            size: 50,
          ),
        ),
      ),
    );
  }
}
