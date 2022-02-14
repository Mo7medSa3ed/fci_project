import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:fci_project/presentation/shared_widgets/app_logo.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class OnboardScrean extends StatefulWidget {
  const OnboardScrean({Key? key}) : super(key: key);

  @override
  _OnboardScreanState createState() => _OnboardScreanState();
}

class _OnboardScreanState extends State<OnboardScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              assetImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: defultPadding,
              right: defultPadding,
              bottom: kheight * 0.08,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLogo(),
                  SizedBox(height: defultPadding),
                  const PrimaryText(
                    text: 'مرحباً بك فى متجرنا',
                    textAlign: TextAlign.center,
                    color: kwhite,
                    fontWeight: FontWeight.bold,
                    fontSizeRatio: 2,
                  ),
                  const PrimaryText(
                    text: 'احصل ع كل م تريده فى اسرع وقت',
                    textAlign: TextAlign.center,
                    color: kgrey,
                  ),
                  SizedBox(height: defultPadding * 1.5),
                  PrimaryButton(
                      text: 'ابدأ',
                      onTap: () async {
                        await LocalStorage.setString(isFirst, 'false');
                        Nav.goToScreanAndRemoveUntill(HomeScrean());
                        return;
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
