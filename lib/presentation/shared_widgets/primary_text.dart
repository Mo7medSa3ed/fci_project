import 'package:fci_project/main.dart';

import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    Key? key,
    @required this.text,
    this.textAlign = TextAlign.start,
    this.color = kblack,
    this.fontSizeRatio = 1,
    this.onTap,
    this.maxlines,
    this.overflow,
    this.textStyle,
    this.hasOffer = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String? text;
  final TextAlign? textAlign;
  final double fontSizeRatio;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool hasOffer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: kprimary.withOpacity(0.1),
      highlightColor: kprimary.withOpacity(0.1),
      child: Text(
        text ?? '',
        textAlign: textAlign,
        maxLines: maxlines,
        overflow: overflow,
        style: textStyle ??
            TextStyle(
                color: color ?? kprimary,
                fontSize: kdefaultTextSize * fontSizeRatio,
                decoration:
                    hasOffer ? TextDecoration.lineThrough : TextDecoration.none,
                fontWeight: fontWeight ?? FontWeight.bold),
      ),
    );
  }
}
