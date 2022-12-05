import 'package:flutter/material.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../providers/providers.dart';

class AppBarApp extends StatelessWidget with PreferredSizeWidget {
  const AppBarApp({
    Key? key,
    required this.sp,
  }) : super(key: key);

  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      // automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
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
