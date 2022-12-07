import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:w2w_app/widgets/app_bar_app.dart';

import '../providers/providers.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    return Scaffold(
      appBar: AppBarApp(sp: sp),
      body: Container(
        width: 300,
        child: Row(children: [
          MaterialButton(
            onPressed: () {},
            child: SvgPicture.asset('assets/filter_icon.svg'),
          ),
          Container(
            width: 100,
            child: const TextField(
                decoration: InputDecoration(labelText: 'KSKADAS')),
          )
        ]),
      ),
    );
  }
}
