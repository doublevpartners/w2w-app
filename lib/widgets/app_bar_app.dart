import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:w2w_app/theme/app_theme.dart';
import 'package:w2w_app/widgets/widgets.dart';

import '../providers/providers.dart';

class AppBarApp extends StatelessWidget with PreferredSizeWidget {
  const AppBarApp({
    Key? key,
    required this.sp,
    this.city,
    this.text,
  }) : super(key: key);

  final SignInProvider sp;
  final String? text;
  final String? city;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: ,
      
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: AutoSizeText(
        text ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF6F7789),
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
      ),
      // automaticallyImplyLeading: false,
      // title: city == null ? Text(city ?? '') : null,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppTheme.secondary),
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
