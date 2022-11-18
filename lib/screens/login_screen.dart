import 'package:flutter/material.dart';
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
              height: 300,
            ),
            CardContainerLogin(
              child: Column(children: const [
                SizedBox(
                  height: 10,
                )
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
