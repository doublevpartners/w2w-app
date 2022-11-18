import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/login_form_provider.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
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
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: const _LoginForm(),
                )
              ]),
            ),
            const Text(
              'O Registrate con',
              style: TextStyle(fontSize: 20, color: Colors.white),
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
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          //TODO: mantener la referencia al key
          key: loginForm.formKey,
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
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Password',
                    hintText: '************',
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
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                disabledColor: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepOrange,
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        // quito teclado
                        FocusScope.of(context).unfocus();

                        //TODO: Login Form
                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(Duration(seconds: 2));

                        //TODO: Validar si el login es correcto
                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'home');
                      },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Por favor espere...' : 'Registrar',
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
