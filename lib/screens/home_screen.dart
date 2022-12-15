import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/models/city_model.dart';
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
    return Column(
      children: [
        Stack(
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
              child: const AutoSizeText(
                'World',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Positioned(
              top: size.height * 0.04,
              left: size.width * 0.4,
              child: const AutoSizeText(
                'To Walk',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _ButtonsHome(
                size: size,
                svg: 'assets/home_location.svg',
                text: 'Todas las Rutas',
                screen: const CitiesScreen(city: 'Madrid'),
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              _ButtonsHome(
                size: size,
                svg: 'assets/home_person.svg',
                text: 'Cerca de ti',
                screen: const CitiesScreen(city: 'Madrid'),
              )
            ]),
            _SearchInput(size: size),
          ],
        ),
      ],
    );
  }
}

class _ButtonsHome extends StatelessWidget {
  const _ButtonsHome({
    Key? key,
    required this.size,
    required this.svg,
    required this.text,
    this.screen,
  }) : super(key: key);

  final Size size;
  final String svg;
  final String text;
  final dynamic screen;

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
          style: const TextStyle(fontSize: 15, color: AppTheme.third),
        )
      ]),
    );
  }
}

class _SearchInput extends StatefulWidget {
  const _SearchInput({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<_SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<_SearchInput> {
  static List<CityModel> main_cities_list = [
    CityModel(name_city: 'Medellin'),
    CityModel(name_city: 'Barcelona'),
    CityModel(name_city: 'Madrid'),
    CityModel(name_city: 'Ciudad de Mexico'),
    CityModel(name_city: 'Bogota'),
    CityModel(name_city: 'Brasilia'),
    CityModel(name_city: 'Berlin'),
    CityModel(name_city: 'Paris'),
    CityModel(name_city: 'Ottawa'),
    CityModel(name_city: 'Singapore'),
  ];

  List<CityModel> display_list = List.from(main_cities_list);

  void updateList(String value) {
    // this is the function will filter our list
    setState(() {
      display_list = main_cities_list
          .where((element) =>
              element.name_city!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.size.height * 0.2, left: widget.size.height * 0.05),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
      ),
      width: widget.size.width * 0.8,
      decoration: search.text == ''
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.third, width: 2),
              ),
            )
          : const BoxDecoration(),
      child: Column(
        children: [
          TextFormField(
            controller: search,
            onChanged: (value) {
              updateList(value);
            },
            onTap: () {},
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
          const SizedBox(
            height: 10,
          ),
          if (search.text != '')
            display_list.isEmpty
                ? const Center(
                    child: Text('No se encontro ningun resultado'),
                  )
                : Container(
                    padding: EdgeInsets.zero,
                    height: MediaQuery.of(context).size.height * 0.19,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: display_list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: const Color.fromARGB(173, 158, 158, 158),
                            child: ListTile(
                              title: MaterialButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    search.text =
                                        display_list[index].name_city!;

                                    nextScreen(context,
                                        CitiesScreen(city: search.text));

                                    search.clear();
                                  },
                                  child: Text(
                                    display_list[index].name_city!,
                                    style:
                                        const TextStyle(color: AppTheme.third),
                                  )),
                            ),
                          );
                        }),
                  )
        ],
      ),
    );
  }
}
