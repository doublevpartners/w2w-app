import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          child: const Text(
            '¿No tienes Cuenta?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          child: const Text(
            'Inscribete',
            style: TextStyle(
                color: AppTheme.third,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
