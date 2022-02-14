import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';

import 'package:fci_project/style/colors.dart';
import 'package:fci_project/style/text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      @required this.text,
      this.icon,
      this.hasIcon = false,
      this.outline = false,
      @required this.onTap})
      : super(key: key);
  final String? text;
  final IconData? icon;
  final bool? hasIcon;
  final bool? outline;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (((hasIcon ?? false) && icon != null) || icon != null) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: PrimaryIcon(icon),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
            padding:
                MaterialStateProperty.all(EdgeInsets.all(defultPadding / 1.5)),
          ),
          label: PrimaryText(
            text: text ?? '',
            textStyle: TStyle.filledButtonTextStyle,
          ),
        ),
      );
    } else if (outline ?? false) {
      return OutlinedButton(
          onPressed: onTap,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
              side: MaterialStateProperty.all(
                  const BorderSide(color: kprimary, width: 1)),
              padding: MaterialStateProperty.all(
                  EdgeInsets.all(defultPadding / 1.5))),
          child: PrimaryText(
            text: text ?? '',
            textStyle: TStyle.outBorderButtonTextStyle,
          ));
    } else {
      return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          tapTargetSize: MaterialTapTargetSize.padded,
          padding:
              MaterialStateProperty.all(EdgeInsets.all(defultPadding / 1.5)),
        ),
        child: PrimaryText(
          text: text ?? '',
          textAlign: TextAlign.center,
          textStyle: TStyle.filledButtonTextStyle,
        ),
      );
    }
  }
}
