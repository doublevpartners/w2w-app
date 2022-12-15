import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
        child: Divider(
      color: AppTheme.third,
      height: 1.5,
    ));
  }
}
