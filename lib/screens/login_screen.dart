// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../utils/snack_bars.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/imageLogin.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: AuthBackgroud(
            child: Column(
              children: [
                CardContainerLogin(
                  child: Column(children: [
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    )
                  ]),
                ),
                BuildDivider(
                  size: size,
                  text: 'O ingresa con',
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const RowContainerLogin(),
                SizedBox(
                  height: size.height * 0.04,
                ),
                AlreadyHaveAnAccountCheck(
                    press: () =>
                        Navigator.pushReplacementNamed(context, 'register'))
              ],
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
  bool isEmail = false, isPassword = false, isOscured = true;
  late IconData errorIcon;

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        // ignore: todo
        //TODO: mantener la referencia al key
        key: loginForm.formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: AppTheme.third),
              autocorrect: false,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Correo eléctronico',
                  // hintText: 'example@mail.com',
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

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'Correo  invalido';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              style: const TextStyle(color: AppTheme.third),
              autocorrect: false,
              autofocus: false,
              obscureText: isOscured,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: isPassword
                  ? InputDecorations.authInputDecoration(
                      hintText: 'Contraseña',
                      // hintText: '************',
                      prefixIcon: 'lock_icon.svg',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isOscured = !isOscured;
                          });
                        },
                        icon: Icon(
                          isOscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppTheme.third,
                        ),
                      ),
                    )
                  : InputDecorations.authInputDecoration(
                      hintText: 'Contraseña',
                      // hintText: '************',
                      prefixIcon: 'lock_icon.svg',
                    ),
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
              height: 15,
            ),
            Container(
              alignment: Alignment.topRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(39, 163, 159, 159)),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'forgot'),
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              disabledColor: Theme.of(context).disabledColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(55)),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      if (isEmail && isPassword) {
                        // quito teclado
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<SignInProvider>(context, listen: false);

                        // ignore: todo
                        //TODO: Login Form
                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        // await Future.delayed(Duration(seconds: 2));

                        // ignore: todo
                        //TODO: Validar si el login es correcto
                        if (authService.first == false) {
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            // TODO: mostrar error en pantalla
                            print(errorMessage);
                            // ignore: use_build_context_synchronously
                            openSnackBar(context,
                                'Correo ó Contraseña Invalido', Colors.red);

                            loginForm.isLoading = false;
                          }
                        } else {
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(
                                context, 'onboarding');
                          } else {
                            // TODO: mostrar error en pantalla
                            print(errorMessage);
                            // ignore: use_build_context_synchronously
                            openSnackBar(context,
                                'Correo ó Contraseña Invalido', Colors.red);

                            loginForm.isLoading = false;
                          }
                        }
                      }
                    },
              child: Container(
                  width: double.maxFinite,
                  decoration: !loginForm.isLoading
                      ? isEmail && isPassword
                          ? BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppTheme.primary, AppTheme.secondary],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
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
                    loginForm.isLoading
                        ? 'Por favor espere...'
                        : 'Iniciar sesión',
                    style: const TextStyle(color: AppTheme.third),
                    textAlign: TextAlign.center,
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
