import 'package:fci_project/main.dart';

import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class TStyle {
  static final hintStyle =
      TextStyle(color: kgrey, fontSize: kdefaultTextSize * 0.7);
  static final filledButtonTextStyle = TextStyle(
      color: kwhite, fontWeight: FontWeight.bold, fontSize: kdefaultTextSize);
  static final outBorderButtonTextStyle = TextStyle(
      color: kprimary, fontWeight: FontWeight.bold, fontSize: kdefaultTextSize);
  static final headerTextStyle = TextStyle(
      color: kwblack, fontWeight: FontWeight.bold, fontSize: kdefaultTextSize);

  static TextStyle customTextStyle(
      {double fontSizeRatio = 1, Color? fontColor, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: kdefaultTextSize * fontSizeRatio,
      color: fontColor ?? kblack,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
