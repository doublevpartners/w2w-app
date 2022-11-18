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
          child: Column(
        children: [
          TextFormField(
              autocorrect: false,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  labelText: 'Email',
                  hintText: 'example@mail.com',
                  prefixIcon: Icons.email_outlined)),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                labelText: 'Password',
                hintText: '************',
                prefixIcon: Icons.lock_open),
          ),
        ],
      )),
    );
  }
}
