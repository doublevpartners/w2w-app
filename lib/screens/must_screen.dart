import 'package:flutter/material.dart';

class MustScreen extends StatelessWidget {
  const MustScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MustScreen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
