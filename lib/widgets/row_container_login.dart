import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/screens/home_screen.dart';
import 'package:w2w_app/utils/next_screen.dart';
import 'package:w2w_app/utils/snack_bars.dart';

class RowContainerLogin extends StatefulWidget {
  const RowContainerLogin({super.key});

  @override
  State<RowContainerLogin> createState() => _RowContainerLoginState();
}

class _RowContainerLoginState extends State<RowContainerLogin> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Row(
      key: _scaffoldKey,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          disabledColor: Colors.grey,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          onPressed: () async {
            // * Version 1.0.0
            // await AuthGoogleServices.signInWithGoogle(context: context);
            // Navigator.pushReplacementNamed(context, 'home');

            // final provider =
            //     Provider.of<GoogleSignInProvider>(context, listen: false);
            // await provider.signInWithGoogle(context: context);
            // Future.microtask(
            //     () => Navigator.pushReplacementNamed(context, 'home'));

            await handleGoogleSignIn();
          },
          child: const CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
                'https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png'),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        MaterialButton(
          disabledColor: Colors.grey,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          onPressed: () {
            handleFacebookSignIn();
          },
          child: const CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/b2/46/d8/b246d896bd1a2e359c2227f6823bed56.jpg'),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        MaterialButton(
          disabledColor: Colors.grey,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          onPressed: () {},
          child: const CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
                'https://w7.pngwing.com/pngs/589/546/png-transparent-apple-logo-new-york-city-brand-computer-apple-company-computer-logo.png'),
          ),
        )
      ],
    );
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackBar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
      // facebookController.reset();
    } else {
      await sp.signInWithGoogle().then((value) => {
            if (sp.hasError == true)
              {
                openSnackBar(context, sp.errorCode.toString(), Colors.red),
                googleController.reset(),
              }
            else
              {
                // checking wheter user exists or not
                sp.checkUserExists().then((value) async {
                  if (value == true) {
                    // user exists
                    await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                        .saveDataToSharedPreferences()
                        .then((value) => sp.setSignIn().then((value) {
                              googleController.success();
                              handleAfterSignIn();
                            })));
                  } else {
                    // user not exists
                    sp.saveDataToFirestore().then((value) => sp
                        .saveDataToSharedPreferences()
                        .then((value) => sp.setSignIn().then((value) {
                              googleController.success();
                              Navigator.pushReplacementNamed(
                                  context, 'slideshow');
                            })));
                  }
                })
              }
          });
    }
  }

  Future handleFacebookSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackBar(context, "Check your Internet connection", Colors.red);
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) => {
            if (sp.hasError == true)
              {
                openSnackBar(context, sp.errorCode.toString(), Colors.red),
                googleController.reset(),
              }
            else
              {
                // checking wheter user exists or not
                sp.checkUserExists().then((value) async {
                  if (value == true) {
                    // user exists
                    await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                        .saveDataToSharedPreferences()
                        .then((value) => sp.setSignIn().then((value) {
                              facebookController.success();
                              handleAfterSignIn();
                            })));
                  } else {
                    // user not exists
                    sp.saveDataToFirestore().then((value) => sp
                        .saveDataToSharedPreferences()
                        .then((value) => sp.setSignIn().then((value) {
                              facebookController.success();
                              Navigator.pushReplacementNamed(
                                  context, 'slideshow');
                            })));
                  }
                })
              }
          });
    }
  }

  // handle after sign
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const HomeScreen());
    });
  }
}
