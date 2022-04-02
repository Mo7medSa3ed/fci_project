import 'package:fci_project/main.dart';

import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          assetImage,
          fit: BoxFit.fill,
        ),
        CircularProgressIndicator(color: kprimary),
      ],
    );
  }
}
