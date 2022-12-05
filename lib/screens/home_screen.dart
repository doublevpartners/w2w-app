import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/utils/next_screen.dart';
import 'package:w2w_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    final authService = context.read<SignInProvider>();

    Future joder() async {
      final token = await authService.readToken();
      return token;
    }

    // final lol = joder().then((value) => print('Este es el token $value'));

    // final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/home.jpg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Scaffold(
        endDrawer: sp.isSignedIn == true ? EndDrawerApp(size: size) : null,
        appBar: AppBarApp(sp: sp),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const _BodyHome(),
            Positioned(
              top: size.height * 0.65,
              right: size.width * 0,
              child: sp.isSignedIn == false
                  ? ButtonLogin(
                      size: size,
                      sp: sp,
                    )
                  : Container(),
            ),
            Positioned(
              top: size.height * 0.75,
              left: size.width * 0.4,
              child: FloatingButtonHome(size: size),
            )
          ],
        ),
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
        padding: EdgeInsets.only(bottom: 300),
        child: Stack(
          children: [
            Positioned(
              // top: size.height * 0.01,
              left: size.width * 0.08,
              child: SvgPicture.asset(
                'assets/home.svg',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              // top: size.height * 0.01,
              left: size.width * 0.4,
              child: AutoSizeText(
                'World',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.end,
              ),
            ),
            Positioned(
              top: size.height * 0.04,
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
                screen: CitiesScreen(),
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              _ButtonsHome(
                  size: size,
                  svg: 'assets/home_person.svg',
                  text: 'Cerca de ti',
                  screen: HomeScreen())
            ]),
          ],
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
    required this.screen,
  }) : super(key: key);

  final Size size;
  final String svg;
  final String text;
  final screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.35),
      child: Column(children: [
        MaterialButton(
          padding: EdgeInsets.all(size.height * 0.01),
          color: const Color.fromARGB(129, 163, 159, 159),
          shape: const CircleBorder(),
          child: SvgPicture.asset(
            svg,
            width: size.width * 0.07,
          ),
          onPressed: () {
            nextScreen(context, screen);
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        AutoSizeText(
          text,
          style: const TextStyle(fontSize: 15),
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
      margin: EdgeInsets.only(top: size.height * 0.2, left: size.width * 0.12),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.third, width: 2),
        ),
      ),
      child: TextFormField(
        onTap: () => {},
        // showSearch(context: context, delegate: CitySearchDelegate()),
        cursorColor: AppTheme.third,
        autofocus: false,
        style: const TextStyle(color: AppTheme.third),
        decoration: const InputDecoration(
          hintText: 'Elige tu Ciudad',
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.third,
            size: 25,
          ),
        ),
      ),
    );
  }
}
