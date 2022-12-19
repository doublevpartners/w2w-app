import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() press;
  const AlreadyHaveAnAccountCheck(
      {super.key, this.login = true, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            login ? '¿No tienes cuenta? ' : '¿Ya tienes cuenta? ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              login ? 'Inscribirse' : 'Inicia Sesión',
              style: const TextStyle(
                  color: AppTheme.third,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
