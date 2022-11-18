import 'package:flutter/material.dart';

class RowContainerLogin extends StatelessWidget {
  const RowContainerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          disabledColor: Colors.grey,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          onPressed: () {},
          child: const CircleAvatar(
            maxRadius: 40,
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
          onPressed: () {},
          child: const CircleAvatar(
            maxRadius: 40,
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
            maxRadius: 40,
            backgroundImage: NetworkImage(
                'https://w7.pngwing.com/pngs/589/546/png-transparent-apple-logo-new-york-city-brand-computer-apple-company-computer-logo.png'),
          ),
        )
      ],
    );
  }
}
