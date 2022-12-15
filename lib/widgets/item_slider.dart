import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/utils/next_screen.dart';

class ItemSlider extends StatelessWidget {
  const ItemSlider({super.key, required this.size, required this.city});
  final Size size;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: size.width * 1,
      height: size.height * 0.2,
      child: _ListItem(size: size, city: city),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.size,
    required this.city,
  }) : super(key: key);

  final Size size;
  final String city;

  @override
  Widget build(BuildContext context) {
    List<String> nameItems = [
      'Rutas',
      'Restaurantes',
      'Eventos',
      'Tours',
      'Entradas',
      'Must de la ciudad'
    ];
    List<dynamic> routeItems = const [
      RouteScreen(),
      RestaurantScreen(),
      EventsScreen(),
      TourScreen(),
      EntradasScreen(),
      MustScreen(),
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nameItems.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              nextScreen(context, routeItems[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              width: size.width * 0.28,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.secondary,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(4, 4))
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        nextScreen(context, routeItems[index]);
                      },
                      child: AutoSizeText(nameItems[index],
                          style: nameItems[index] == 'Must de la ciudad'
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                )
                              : const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                          textAlign: TextAlign.center,
                          maxLines:
                              nameItems[index] == 'Must de la ciudad' ? 2 : 1),
                    ),
                  ]),
            ),
          );
        });
  }
}
