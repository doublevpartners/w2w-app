import 'package:flutter/material.dart';

class TourScreen extends StatelessWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TourScreen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
