import 'package:flutter/material.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../providers/providers.dart';

class AppBarApp extends StatelessWidget with PreferredSizeWidget {
  const AppBarApp({
    Key? key,
    required this.sp,
    this.city,
  }) : super(key: key);

  final SignInProvider sp;
  final String? city;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      // automaticallyImplyLeading: false,
      // title: city == null ? Text(city ?? '') : null,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      actions: [
        sp.isSignedIn == true
            ? Builder(builder: (context) {
                return const MenuButton(
                  isOpen: true,
                );
              })
            : Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
