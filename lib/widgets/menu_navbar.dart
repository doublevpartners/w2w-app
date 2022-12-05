import 'package:flutter/material.dart';

class Menu_Navbar extends StatelessWidget {
  const Menu_Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          child: Image.asset('assets/home.jpg'),
        )
      ]),
    );
  }
}
