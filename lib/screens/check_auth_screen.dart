import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/screens/screens.dart';
import 'package:w2w_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) return Text('Espere');

          if (snapshot.data == '') {
            Future.microtask(() {
              // Navigator.of(context).pushReplacementNamed('home');
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: Duration(seconds: 5)));
            });
          } else {
            Future.microtask(() {
              // Navigator.of(context).pushReplacementNamed('home');
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: Duration(seconds: 5)));
            });
          }

          return Container();
        },
      )),
    );
  }
}
