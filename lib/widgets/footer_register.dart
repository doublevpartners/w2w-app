import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FooterRegister extends StatelessWidget {
  const FooterRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          child: const AutoSizeText(
            '¿Ya Tienes Cuenta?',
            style: TextStyle(color: Colors.white, fontSize: 16),
            maxLines: 1,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          child: const AutoSizeText(
            'Inicia Sesion',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
