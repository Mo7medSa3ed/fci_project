import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';

import 'package:fci_project/style/colors.dart';
import 'package:fci_project/style/text_style.dart';
import 'package:flutter/material.dart';

class ClickText extends StatelessWidget {
  const ClickText(
      {Key? key,
      @required this.clickText,
      @required this.firstText,
      this.sizeRatio = 1.0,
      this.center = true,
      this.onClick})
      : super(key: key);
  final String? firstText;
  final String? clickText;
  final double? sizeRatio;
  final bool? center;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          center! ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryText(
          text:firstText ?? '',
          textStyle: TStyle.customTextStyle(fontSizeRatio: sizeRatio!),
        ),
        SizedBox(width: defultPadding / 4),
        Flexible(
          child: InkWell(
            onTap: onClick,
            splashColor: kprimary.withOpacity(0.1),
            highlightColor: kprimary.withOpacity(0.1),
            child: PrimaryText(
              text:clickText ?? "",
              textStyle: TStyle.customTextStyle(
                  fontColor: kprimary,
                  fontWeight: FontWeight.bold,
                  fontSizeRatio: sizeRatio! * 1.1),
            ),
          ),
        ),
      ],
    );
  }
}
