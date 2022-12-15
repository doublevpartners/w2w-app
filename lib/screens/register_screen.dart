import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../utils/snack_bars.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("assets/imageLogin.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: RegisterBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardContainerRegister(
                    child: Column(
                      children: [
                        ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const _LoginForm(),
                        )
                      ],
                    ),
                  ),
                  BuildDivider(
                    size: size,
                    text: 'O ingresa con',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const RowContainerLogin(),
                  const SizedBox(
                    height: 10,
                  ),
                  AlreadyHaveAnAccountCheck(
                    press: () =>
                        Navigator.pushReplacementNamed(context, 'login'),
                    login: false,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool isPassword = false,
      isName = false,
      isEmail = false,
      isConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final size = MediaQuery.of(context).size;
    const double separate = 10;
    // TextEditingController _confirmPassword = TextEditingController();
    return Container(
      child: Form(
          // ignore: todo
          //TODO: mantener la referencia al key
          key: loginForm.formKey,
          // autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: false,
                style: const TextStyle(color: AppTheme.third),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nombre Completo', prefixIcon: 'email_icon.svg'),
                onChanged: (value) {
                  setState(() {
                    isName = value.length >= 3 ? true : false;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
                    return "Ingresa un Nombre real";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: separate,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                style: const TextStyle(color: AppTheme.third),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Correo eléctronico',
                    prefixIcon: 'email_icon.svg'),
                onChanged: (value) {
                  loginForm.email = value;
                  setState(() {
                    isEmail = value.length >= 3 ? true : false;
                  });
                },
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Ups esto no es un correo';
                },
              ),
              const SizedBox(
                height: separate,
              ),
              Stack(
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(129, 163, 159, 159),
                        borderRadius: BorderRadius.circular(55)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: InternationalPhoneNumberInput(
                      initialValue: PhoneNumber(isoCode: 'CO'),
                      selectorTextStyle: const TextStyle(color: AppTheme.third),
                      textStyle: const TextStyle(color: AppTheme.third),
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      spaceBetweenSelectorAndTextField: 15,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      inputDecoration: InputDecorations.authInputDecoration(
                          hintText: 'Número celular',
                          prefixIcon: 'phone_icon.svg'),
                      errorMessage: 'Número de telefono no valido',
                      onInputChanged: (PhoneNumber value) {
                        // print(value.phoneNumber);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: separate,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                style: const TextStyle(color: AppTheme.third),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Contraseña',
                    // hintText: '************',
                    prefixIcon: 'lock_icon.svg'),
                onChanged: (value) {
                  loginForm.password = value;
                  setState(() {
                    isPassword = value.length >= 3 ? true : false;
                  });
                },
                validator: (value) {
                  if (value != null && value.length >= 8) return null;
                  return 'La contraseña debe tener minimo 8 caracteres';
                },
              ),
              const SizedBox(
                height: separate,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                style: const TextStyle(color: AppTheme.third),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Confirmar contraseña',
                    // hintText: '************',
                    prefixIcon: 'lock_icon.svg'),
                onChanged: (value) {
                  setState(() {
                    isConfirmPassword = value.length >= 3 ? true : false;
                  });
                },
                validator: (value) {
                  if (value == loginForm.password) return null;

                  return 'Deben ser identicas';
                },
              ),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                disabledColor: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55)),
                onPressed: () => Platform.isAndroid
                    ? displayDialogAndroid(context)
                    : displayDialogIOS(context),
                // onPressed: loginForm.isLoading
                //     ? null
                //     : () async {
                //         // quito teclado
                //         if (isConfirmPassword &&
                //             isEmail &&
                //             isName &&
                //             isPassword) {
                //           FocusScope.of(context).unfocus();
                //           final authService = Provider.of<SignInProvider>(
                //               context,
                //               listen: false);

                //           //TODO: Login Form
                //           if (!loginForm.isValidForm()) return;

                //           loginForm.isLoading = true;

                //           // await Future.delayed(Duration(seconds: 2));

                //           //TODO: Validar si el login es correcto
                //           final String? errorMessage =
                //               await authService.createUser(
                //                   loginForm.email, loginForm.password, true);

                //           if (errorMessage == null) {
                //             // Navigator.pushReplacementNamed(context, 'slideshow');
                //             Platform.isAndroid
                //                 ? displayDialogAndroid(context)
                //                 : displayDialogIOS(context);
                //           } else {
                //             // TODO: mostrar error en pantalla
                //             print(errorMessage);
                //             // ignore: use_build_context_synchronously
                //             openSnackBar(
                //                 context, 'Correo ya existente', Colors.red);
                //             loginForm.isLoading = false;
                //           }
                //         }
                //       },
                child: Container(
                    width: double.infinity,
                    decoration: !loginForm.isLoading
                        ? isName && isEmail && isPassword && isConfirmPassword
                            ? BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppTheme.primary,
                                  AppTheme.secondary
                                ]),
                                borderRadius: BorderRadius.circular(55))
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
                                borderRadius: BorderRadius.circular(55))
                        : null,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Por favor espere...' : 'Registrar',
                      style: const TextStyle(color: AppTheme.third),
                      textAlign: TextAlign.center,
                    )),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                child: AutoSizeText(
                  'Al registrarte, estas aceptando los términos de servicio, las pautas y ha leído la Política de privacidad.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Titulo'),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox(
                height: 10,
              ),
              FlutterLogo(
                size: 100,
              )
            ]),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  )),
              MaterialButton(
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Color.fromRGBO(39, 50, 83, 0.85),
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            backgroundColor: const Color.fromARGB(141, 255, 255, 255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.primary, AppTheme.secondary],
                    ),
                    shape: BoxShape.circle),
                child: SvgPicture.asset('assets/check.svg'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                '¡Felicitaciones!',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                'Ya estás listo para iniciar sesión .',
                textAlign: TextAlign.center,
              )
            ]),
            actions: [
              MaterialButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'checking'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [AppTheme.primary, AppTheme.secondary]),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'Continuar',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        });
  }
}
