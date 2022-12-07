import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/theme/app_theme.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/cities.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Scaffold(
          endDrawer: sp.isSignedIn == true ? EndDrawerApp(size: size) : null,
          appBar: AppBarApp(sp: sp),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonHome(size: size),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  _BodyCities(
                    size: size,
                    sp: sp,
                    city: city,
                  ),
                  Positioned(
                    top: size.height * 0.4,
                    child: ItemSlider(
                      size: size,
                      city: city,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.7,
                    right: size.width * 0,
                    child:
                        // ignore: todo
                        sp.isSignedIn == false
                            ? ButtonLogin(
                                size: size,
                                sp: sp,
                              )
                            : Container(),
                    // ButtonLogin(size: size, sp: sp),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class _BodyCities extends StatelessWidget {
  final String city;
  const _BodyCities({
    Key? key,
    required this.size,
    required this.sp,
    required this.city,
  }) : super(key: key);

  final Size size;
  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.height * 0.03,
              bottom: size.height * 0.25),
          width: size.width * 0.88,
          height: size.height * 0.41,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 100),
            color: AppTheme.third,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 200,
                      child: AutoSizeText(
                        city,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const _UnclockCities(),
                  ],
                ),
              ),
              const AutoSizeText(
                'Descubre \n las Mejores Rutas',
                style: TextStyle(
                    color: AppTheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
                maxLines: 2,
              )
            ],
          )),
    );
  }
}

class _UnclockCities extends StatelessWidget {
  const _UnclockCities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: 13,
      shape: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [AppTheme.primary, AppTheme.secondary])),
        child: const Icon(
          Icons.lock,
          color: AppTheme.third,
          size: 35,
        ),
      ),
    );
  }
}
