import 'package:fci_project/main.dart';

import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, this.fText = '', this.lText = '', this.onTap})
      : super(key: key);
  final String fText;
  final String lText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryText(
            text: fText,
            color: kblack,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
            maxlines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: defultPadding),
        InkWell(
          onTap: onTap,
          splashColor: kprimary.withOpacity(0.08),
          highlightColor: kprimary.withOpacity(0.08),
          child: PrimaryText(
            text: lText,
            fontSizeRatio: 0.7,
            textAlign: TextAlign.end,
            fontWeight: FontWeight.w600,
            color: kprimary,
            maxlines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
