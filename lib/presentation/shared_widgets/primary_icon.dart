import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryIcon extends StatelessWidget {
  const PrimaryIcon(this.icon, {Key? key, this.iconSizeRatio = 1, this.color})
      : super(key: key);
  final IconData? icon;
  final double iconSizeRatio;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 24 * iconSizeRatio,
      color: color,
    );
  }
}
