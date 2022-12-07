// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/screens/onboarding_screen.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/utils/next_screen.dart';
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
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
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
                const Text(
                  'O Ingresa con',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RowContainerLogin(),
                const SizedBox(
                  height: 10,
                ),
                const FooterLogin()
              ],
            ),
          )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();
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
                  labelText: 'Email',
                  hintText: 'example@mail.com',
                  prefixIcon: Icons.email_outlined),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ups esto no es un correo';
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              style: const TextStyle(color: AppTheme.third),
              autocorrect: false,
              autofocus: false,
              obscureText: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Password',
                // hintText: '************',
                prefixIcon: Icons.lock_open,
              ),
              onChanged: (value) => loginForm.password = value,
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
                child: const Text(
                  'Olvidaste Contraseña?',
                  style: TextStyle(color: Colors.white),
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
                      final String? errorMessage = await authService.login(
                          loginForm.email, loginForm.password);

                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'onboarding');
                      } else {
                        // TODO: mostrar error en pantalla
                        print(errorMessage);
                        // ignore: use_build_context_synchronously
                        openSnackBar(context, 'Correo ó Contraseña Invalido',
                            Colors.red);

                        loginForm.isLoading = false;
                      }
                    },
              child: Container(
                  width: double.maxFinite,
                  decoration: !loginForm.isLoading
                      ? BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [AppTheme.primary, AppTheme.secondary]),
                          borderRadius: BorderRadius.circular(55))
                      : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  child: Text(
                    loginForm.isLoading
                        ? 'Por favor espere...'
                        : 'Iniciar Sesión',
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
