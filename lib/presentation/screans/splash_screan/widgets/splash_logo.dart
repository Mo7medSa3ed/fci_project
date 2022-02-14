import 'package:fci_project/main.dart';

import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                assetImage,
                height: kheight * 0.07,
                width: kheight * 0.07,
                fit: BoxFit.fill,
              ),
              SizedBox(width: defultPadding / 2),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PrimaryText(
                      text: 'متجر الماسة',
                      color: kwhite,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                      maxlines: 1,
                    ),
                    PrimaryText(
                      text: 'للبيع من ع النت',
                      color: kwhite,
                      fontSizeRatio: 0.8,
                      overflow: TextOverflow.ellipsis,
                      maxlines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Center(child: CircularProgressIndicator(color: kwhite))),
      ],
    );
  }
}
