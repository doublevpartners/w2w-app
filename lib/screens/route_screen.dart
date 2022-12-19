import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/config/config.dart';
import 'package:w2w_app/models/city_model.dart';
import 'package:w2w_app/models/place_model.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    final places_list = PlaceModel.places_list;

    return MediaQuery.removePadding(
      context: context,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/screens/routes.jpg'),
            fit: BoxFit.cover,
            // opacity: 0.2,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.6), BlendMode.colorDodge),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarApp(
            sp: sp,
            text: text ?? 'Madrid',
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.09),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(33, 163, 159, 159),
                              borderRadius: BorderRadius.circular(10)),
                          child: SvgPicture.asset(
                            'assets/filter_icon.svg',
                            fit: BoxFit.scaleDown,
                            height: 45,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {},
                            decoration: InputDecorations.searchInputDecoration(
                                hintText: 'Buscar',
                                prefixIcon: 'search_icon.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.09),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _Options(
                          text: 'Rutas',
                          color: AppTheme.primary,
                          icon: Config.locationIcon,
                        ),
                        _Options(
                          text: 'Restaurantes',
                          icon: 'assets/icons/routes/restaurant_icon.svg',
                        ),
                        _Options(
                          text: 'Eventos',
                          icon: 'assets/icons/routes/events_icon.svg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.09),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Rutas destacadas',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: AppTheme.secondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: () =>
                        Future.delayed(const Duration(milliseconds: 5)),
                    color: AppTheme.primary,
                    displacement: 0,
                    strokeWidth: 2,
                    child: GridView.builder(
                      padding:
                          EdgeInsets.only(bottom: size.height * 0.05, top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: places_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: double.infinity,
                              height: size.height * 0.199,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(places_list[index].image),
                                  fit: BoxFit.cover,
                                  opacity: places_list[index].isPremium != false
                                      ? 0.7
                                      : 1,
                                  colorFilter:
                                      places_list[index].isPremium != false
                                          ? ColorFilter.mode(
                                              const Color(0xFFC4C4C4)
                                                  .withOpacity(0.7),
                                              BlendMode.color)
                                          : null,
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (places_list[index].isPremium == false)
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                158, 255, 255, 255)),
                                        child: const Icon(
                                          Icons.favorite,
                                          size: 15,
                                          color: AppTheme.primary,
                                        ),
                                      ),
                                    Spacer(
                                      flex:
                                          places_list[index].isPremium != false
                                              ? 18
                                              : 12,
                                    ),
                                    if (places_list[index].isPremium != false)
                                      Container(
                                          padding: const EdgeInsets.all(7),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  214, 255, 255, 255),
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            Config.unlockIcon,
                                            color: AppTheme.primary,
                                            height: 30,
                                          )),
                                    Spacer(
                                      flex:
                                          places_list[index].isPremium != false
                                              ? 9
                                              : 13,
                                    ),
                                    Container(
                                      width: 45,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            158, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xFFEDB007),
                                            size: 13,
                                          ),
                                          Text(
                                            places_list[index]
                                                .rating
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    )
                                  ]),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 120,
                                child: Text(
                                  places_list[index].name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: AppTheme.secondary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ))
                ],
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
              Positioned(
                top: size.height * 0.75,
                left: size.width * 0.425,
                child: FloatingButtonHome(size: size),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Options extends StatelessWidget {
  const _Options({
    Key? key,
    required this.text,
    this.color,
    required this.icon,
  }) : super(key: key);
  final String text;
  final color;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: color != null ? 20 : 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
            color: color != null ? AppTheme.third : AppTheme.secondary,
            height: 30,
          ),
          SizedBox(
            width: color != null ? 5 : 0,
          ),
          AutoSizeText(
            text,
            style: TextStyle(
                color: color != null ? AppTheme.third : AppTheme.secondary),
          )
        ]),
      ),
    );
  }
}
