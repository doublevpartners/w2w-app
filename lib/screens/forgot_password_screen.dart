import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w2w_app/screens/otp_email_screen.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/utils/next_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool isActive = false;
  TextEditingController email = TextEditingController();

  // EmailAuth emailAuth = EmailAuth(sessionName: "code algo video session");

  // void sendOTP() async {
  //   var res = await emailAuth.sendOtp(recipientMail: email.text, otpLength: 4);
  //   if (res) {
  //     print("Verification Code Sent!");
  //   } else {
  //     print("Failed to send the verification code");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: MaterialButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) return;

          isActive ? nextScreen(context, const OtpEmailScreen()) : null;
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55)),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.1),
          child: Column(children: [
            SizedBox(
              width: size.width * 0.6,
              child: AutoSizeText(
                '¿Olvidaste tu contraseña?',
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
                'Escribe tu correo electrónico, te \nenviaremos el código de\nverificación por correo',
                style: GoogleFonts.varelaRound(
                    textStyle: const TextStyle(color: AppTheme.secondary),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Stack(
                children: [
                  Container(
                      height: (size.height * 0.08) - 3,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(213, 202, 200, 200),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      )),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        setState(() {
                          isActive = value.length >= 6 ? true : false;
                        });
                      },
                      validator: (value) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                        RegExp regExp = RegExp(pattern);
                        final res = regExp.hasMatch(value ?? '')
                            ? null
                            : 'Ups esto no es un correo';
                        return res;
                      },
                      style: const TextStyle(color: AppTheme.secondary),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        hintText: 'Correo eléctronico',
                        hintStyle: const TextStyle(color: AppTheme.secondary),
                        fillColor: AppTheme.third,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/signup/email_icon.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
