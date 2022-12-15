import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:w2w_app/config/config.dart';
import 'package:w2w_app/providers/providers.dart';
import 'package:w2w_app/screens/screens.dart';
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
    final size = MediaQuery.of(context).size;
    final double radius = 20;
    return Row(
      key: _scaffoldKey,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          height: size.height * 0.065,
          disabledColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
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
          child: SvgPicture.asset(
            Config.google_icon,
            height: size.height * 0.04,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          width: size.width * 0.04,
        ),
        MaterialButton(
          height: size.height * 0.065,
          disabledColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          color: Colors.white,
          onPressed: () {
            handleFacebookSignIn();
          },
          child: SvgPicture.asset(
            Config.facebook_icon,
            height: size.height * 0.062,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: size.width * 0.04,
        ),
        MaterialButton(
          height: size.height * 0.065,
          disabledColor: Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          color: Colors.white,
          onPressed: () {},
          child: SvgPicture.asset(
            Config.apple_icon,
            height: size.height * 0.062,
            fit: BoxFit.none,
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
                facebookController.reset(),
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
                                  context, 'onboarding');
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
      nextScreenReplace(context, const SplashScreen());
    });
  }
}
