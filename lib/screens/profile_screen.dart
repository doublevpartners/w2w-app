import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sign_in_provider.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sp = Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      endDrawer: sp.isSignedIn == true ? EndDrawerApp(size: size) : null,
      appBar: AppBarApp(sp: sp),
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          child: Column(children: [
            sp.imageUrl != null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("${sp.imageUrl}"),
                    radius: 50,
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                    radius: 50,
                  ),
            const SizedBox(
              height: 20,
            ),
            sp.name != null
                ? Text(
                    "Welcome ${sp.name}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                : const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${sp.email}",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: Text(
                "${sp.uid}",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
