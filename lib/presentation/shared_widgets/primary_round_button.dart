import 'package:fci_project/main.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class PrimaryRoundButton extends StatelessWidget {
  const PrimaryRoundButton(
      {this.radius = 8.0,
      this.paddingH,
      this.paddingV,
      this.bgColor = kwhite,
      this.borderColor,
      this.overlayColor,
      this.onTap,
      required this.child,
      Key? key})
      : super(key: key);
  final double radius;
  final double? paddingH;
  final double? paddingV;
  final Color bgColor;
  final Color? borderColor;
  final Color? overlayColor;
  final VoidCallback? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: child,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(Size.zero),
          maximumSize: MaterialStateProperty.all(Size(50, 50)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStateProperty.all(
              overlayColor ?? kprimary.withOpacity(0.1)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: (paddingH ?? kpadding / 1.2).toDouble(),
            vertical: (paddingV ?? kpadding / 1.2).toDouble(),
          )),
          backgroundColor: MaterialStateProperty.all(bgColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.toDouble()),
            side: BorderSide(
                width: 2, color: borderColor ?? kwgrey.withOpacity(0.7)),
          ))),
    );
  }
}
