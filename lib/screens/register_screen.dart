import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/screens/login_screen.dart';
import 'package:w2w_app/screens/onboarding_screen.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/utils/next_screen.dart';
import 'package:w2w_app/widgets/slideshow.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../services/notifications_service.dart';
import '../utils/snack_bars.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("assets/imageLogin.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken)),
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
                  const AutoSizeText(
                    'O Registrate con',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const RowContainerLogin(),
                  const SizedBox(
                    height: 30,
                  ),
                  const FooterRegister()
                ],
              ),
            ),
          )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginForm = Provider.of<LoginFormProvider>(context);
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
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre', prefixIcon: Icons.person),
                onChanged: (value) {},
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
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Email',
                    hintText: 'example@mail.com',
                    prefixIcon: Icons.email_outlined),
                onChanged: (value) => loginForm.email = value,
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
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                ),
                child: InternationalPhoneNumberInput(
                  formatInput: false,
                  textStyle: const TextStyle(color: Colors.white),
                  // selectorConfig: const SelectorConfig(
                  //   selectorType: PhoneInputSelectorType.DIALOG,
                  // ),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  spaceBetweenSelectorAndTextField: 18,

                  inputDecoration: InputDecorations.authInputDecoration(
                      labelText: 'Telefono', prefixIcon: Icons.phone),
                  errorMessage: 'Numero de telefono no valido',
                  selectorTextStyle: const TextStyle(
                      backgroundColor: AppTheme.third, color: Colors.black),
                  onInputChanged: (PhoneNumber value) {
                    // print(value.phoneNumber);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Password',
                    // hintText: '************',
                    prefixIcon: Icons.lock_open),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value != null && value.length >= 8) return null;
                  return 'La contraseña debe tener minimo 8 caracteres';
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Confirm Password',
                    // hintText: '************',
                    prefixIcon: Icons.lock_open),
                onChanged: (value) {},
                validator: (value) {
                  if (value == loginForm.password) return null;
                  return 'Deben ser identicas';
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                disabledColor: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55)),
                // onPressed: () => Platform.isAndroid
                //     ? displayDialogAndroid(context)
                //     : displayDialogIOS(context),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        // quito teclado
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<SignInProvider>(context, listen: false);

                        //TODO: Login Form
                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        // await Future.delayed(Duration(seconds: 2));

                        //TODO: Validar si el login es correcto
                        final String? errorMessage =
                            await authService.createUser(
                                loginForm.email, loginForm.password, true);

                        if (errorMessage == null) {
                          // Navigator.pushReplacementNamed(context, 'slideshow');
                          Platform.isAndroid
                              ? displayDialogAndroid(context)
                              : displayDialogIOS(context);
                        } else {
                          // TODO: mostrar error en pantalla
                          print(errorMessage);
                          // ignore: use_build_context_synchronously
                          openSnackBar(
                              context, 'Correo ya existente', Colors.red);
                          loginForm.isLoading = false;
                        }
                      },
                child: Container(
                    width: double.infinity,
                    decoration: !loginForm.isLoading
                        ? BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [AppTheme.primary, AppTheme.secondary]),
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
                    Navigator.restorablePushNamed(context, 'login'),
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
