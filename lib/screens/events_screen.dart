import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: sp.isSignedIn == true ? EndDrawerApp(size: size) : null,
      appBar: AppBarApp(sp: sp),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonHome(size: size),
      body: const Center(
        child: Text(
          'EventsScreen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
