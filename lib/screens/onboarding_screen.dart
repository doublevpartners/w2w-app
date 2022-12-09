import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:w2w_app/models/onboard.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/utils/next_screen.dart';

import '../widgets/widgets.dart';

final List<Onboard> onboardData = [
  Onboard(
      image: 'assets/onboarding/Onboarding1.jpg',
      text: '',
      formatText: 'Se tu propio guía'),
  Onboard(
      image: 'assets/onboarding/Onboarding2.jpg',
      formatText: 'Audios',
      text: ' en tu idioma'),
  Onboard(
      image: 'assets/onboarding/Onboarding3.jpg',
      formatText: 'A un clic',
      text: ' de las mejores rutas')
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        child: PageView.builder(
            controller: _pageController,
            itemCount: onboardData.length,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) => _OnboardContent(
                size: size,
                pageViewController: _pageController,
                image: onboardData[index].image,
                text: onboardData[index].text,
                formatText: onboardData[index].formatText,
                pageIndex: _pageIndex)),
      ),
    );
  }
}

class _OnboardContent extends StatelessWidget {
  const _OnboardContent({
    Key? key,
    required this.size,
    required this.pageViewController,
    required this.image,
    required this.text,
    this.formatText,
    required int pageIndex,
  })  : _pageIndex = pageIndex,
        super(key: key);

  final Size size;
  final PageController pageViewController;
  final String image;
  final String text;
  final String? formatText;
  final int _pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        Container(
          height: size.height * 0.7,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.darken),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _FooterCurvePainter(),
          ),
        ),
        _pageIndex != 2 ? const ButtonSkip() : Container(),
        Positioned(
          top: size.height * 0.65,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
                child: _OnboardText(formatText: formatText, text: text),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: size.height * 0.02,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      onboardData.length,
                      (index) => _DotIndicator(
                        isActive: _pageIndex == index || _pageIndex > index,
                      ),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    if (_pageIndex == 2) {
                      nextScreenReplace(context, const SplashScreen());
                    }

                    pageViewController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  color: AppTheme.third,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55)),
                  child: const AutoSizeText(
                    'Siguiente',
                    style: TextStyle(
                        color: Color.fromRGBO(41, 41, 41, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}

class _OnboardText extends StatelessWidget {
  const _OnboardText({
    Key? key,
    required this.formatText,
    required this.text,
  }) : super(key: key);

  final String? formatText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: formatText,
          style: const TextStyle(
            color: AppTheme.third,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: text,
          style: const TextStyle(
            color: AppTheme.third,
            fontSize: 45,
            fontWeight: FontWeight.normal,
          ),
        ),
      ]),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final bool isActive;
  const _DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        height: 3,
        margin: const EdgeInsets.only(left: 10, bottom: 20, top: 6),
        decoration: BoxDecoration(
            color: isActive
                ? AppTheme.third
                : const Color.fromARGB(72, 158, 158, 158)));
  }
}

class _FooterCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(165.0, 55.0), radius: 180);

    const Gradient gradient =
        LinearGradient(colors: <Color>[AppTheme.primary, AppTheme.secondary]);

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
