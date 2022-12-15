import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:w2w_app/screens/home_screen.dart';

import '../theme/app_theme.dart';
import '../utils/next_screen.dart';

class OtpEmailScreen extends StatefulWidget {
  const OtpEmailScreen({Key? key}) : super(key: key);

  @override
  State<OtpEmailScreen> createState() => _OtpEmailScreenState();
}

class _OtpEmailScreenState extends State<OtpEmailScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: MaterialButton(
          onPressed: () =>
              isActive ? nextScreenReplace(context, const HomeScreen()) : null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
          child: Container(
            height: size.height * 0.08,
            width: size.width * 0.8,
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            decoration: isActive
                ? BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.primary, AppTheme.secondary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(55),
                  )
                : BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(91, 103, 137, 1.000),
                        Color.fromRGBO(91, 103, 137, 1.000),
                        Color.fromRGBO(93, 97, 111, 1.000),
                        Color.fromRGBO(94, 95, 97, 1.000),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(55),
                  ),
            child: const Text(
              'Enviar',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: size.width * 0.6,
                child: AutoSizeText(
                  'Código de verificación',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: AppTheme.secondary),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                width: size.width * 0.77,
                child: AutoSizeText(
                  'El código de verificación se ha \nenviado a tu correo',
                  style: GoogleFonts.varelaRound(
                      textStyle: const TextStyle(color: AppTheme.secondary),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              OtpTextField(
                decoration: const InputDecoration(
                    errorText: 'Código invalido',
                    errorStyle: TextStyle(color: Colors.red)),
                fieldWidth: 65,
                showFieldAsBox: true,
                focusedBorderColor: AppTheme.primary,
                textStyle: const TextStyle(
                    color: AppTheme.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),

                //runs when a code is typed in
                fillColor:
                    const Color.fromARGB(255, 218, 217, 217).withOpacity(0.1),
                filled: true,
                cursorColor: AppTheme.primary,
                onSubmit: (value) {
                  setState(() {
                    isActive = value != '' ? true : false;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                '¿No te llego el código de verificación?',
                style: GoogleFonts.varelaRound(
                  textStyle: const TextStyle(
                      color: AppTheme.secondary, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Volver a enviar',
                style: GoogleFonts.varelaRound(
                  textStyle: const TextStyle(
                      color: AppTheme.primary, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ));
  }
}
