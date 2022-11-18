import 'package:flutter/material.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackgroud(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 350,
            ),
            CardContainerLogin(
              child: Column(children: const [
                SizedBox(
                  height: 20,
                ),
                _LoginForm()
              ]),
            ),
            const Text(
              'O Ingresa con',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          //TODO: mantener la referencia al key
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Email',
                    hintText: 'example@mail.com',
                    prefixIcon: Icons.email_outlined),
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
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Password',
                    hintText: '************',
                    prefixIcon: Icons.lock_open),
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
                      color: const Color.fromARGB(129, 163, 159, 159)),
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
                disabledColor: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepOrange,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  //TODO: Login Form
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
