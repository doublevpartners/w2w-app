import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/config.dart';

class HeaderLogin extends StatelessWidget {
  final String header1;
  final String? header2;

  const HeaderLogin({super.key, required this.header1, this.header2});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: Column(children: [
          SvgPicture.asset(
            Config.app_icon,
            width: 100,
            semanticsLabel: 'World To Walk',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          AutoSizeText(
            header1,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 36,
            ),
          ),
          AutoSizeText(
            header2 ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
