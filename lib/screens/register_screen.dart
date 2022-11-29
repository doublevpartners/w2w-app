import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/providers/login_form_provider.dart';
import 'package:w2w_app/services/services.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/ui/input_decorations.dart';
import 'package:w2w_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("assets/imageLogin.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken)),
      ),
      child: RegisterBackground(
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
      ),
    ));
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
                  textStyle: const TextStyle(color: Colors.black),
                  // selectorConfig: const SelectorConfig(
                  //   selectorType: PhoneInputSelectorType.DIALOG,
                  // ),
                  spaceBetweenSelectorAndTextField: 18,
                  inputDecoration: InputDecorations.authInputDecoration(
                    labelText: 'Telefono',
                    hintText: '3201234567',
                    prefixIcon: Icons.phone,
                  ),
                  errorMessage: 'Numero de telefono no valido',
                  selectorTextStyle: const TextStyle(
                      color: Colors.black, backgroundColor: AppTheme.third),
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
              TextFormField(
                autocorrect: false,
                autofocus: false,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Confirm Password',
                    hintText: '************',
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
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        // quito teclado
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        //TODO: Login Form
                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        // await Future.delayed(Duration(seconds: 2));

                        //TODO: Validar si el login es correcto
                        final String? errorMessage = await authService
                            .createUser(loginForm.email, loginForm.password);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'slideshow');
                        } else {
                          // TODO: mostrar error en pantalla
                          print(errorMessage);
                          NotificationService.showSnackbar(errorMessage);
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
}
