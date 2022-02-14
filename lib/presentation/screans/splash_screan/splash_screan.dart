import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:fci_project/presentation/screans/login_screan/login_screan.dart';
import 'package:fci_project/presentation/screans/onboard_screan/onboard_screan.dart';
import 'package:fci_project/presentation/screans/splash_screan/widgets/splash_logo.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class SplashScrean extends StatelessWidget {
  const SplashScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusColor(color: kprimary, isDark: false);
    Future.delayed(Duration(seconds: 3), () async {
      if ((await LocalStorage.getString(isFirst)).isEmpty) {
        return Nav.goToScreanAndRemoveUntill(OnboardScrean());
      }
      if ((await LocalStorage.getString(token)).isEmpty) {
        return Nav.goToScreanAndRemoveUntill(LoginScrean());
      }
      return Nav.goToScreanAndRemoveUntill(HomeScrean());
    });
    return Scaffold(
      backgroundColor: kprimary,
      body: Center(child: SplashLogo()),
    );
  }
}
