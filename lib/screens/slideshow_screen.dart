import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/models/slider_model.dart';

//* Onboarding
class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 100,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: const _Slides(),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            _Dot(0),
            _Dot(1),
            _Dot(2),
          ]),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
            child: const AutoSizeText(
              'Siguiente',
              style: TextStyle(
                  color: Color.fromRGBO(41, 41, 41, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 100,
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.blue
              : Colors.grey),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    Key? key,
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // print('pagina actual: ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: const <Widget>[
        _Slide(
          imagen: 'assets/Onboarding1.jpg',
          text: 'Se tu propio Guía',
        ),
        _Slide(
          imagen: 'assets/Onboarding2.jpg',
          text: 'Audios en tu idioma',
        ),
        _Slide(
          imagen: 'assets/Onboarding3.jpg',
          text: 'Aun click de las mejores rutas',
        ),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String imagen;
  final String text;
  const _Slide({
    Key? key,
    required this.imagen,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagen),
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(painter: _FooterCurvePainter()),
        ),
        Positioned(
          top: size.height * 0.65,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.6,
                height: size.height * 0.18,
                child: AutoSizeText(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const _Dots(),
            ],
          ),
        )
      ]),
    );
  }
}

class _FooterCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(165.0, 55.0), radius: 180);

    const Gradient gradient = LinearGradient(colors: <Color>[
      Color.fromRGBO(36, 56, 114, 1),
      Color.fromRGBO(41, 41, 41, 1)
    ]);

    final paint = Paint()..shader = gradient.createShader(rect);

    paint.color = const Color.fromRGBO(36, 56, 114, 1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.5, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
