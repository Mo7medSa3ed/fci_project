import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton(this.icon,
      {Key? key, this.iconSizeRatio = 1, this.onTap, this.color})
      : super(key: key);
  final IconData? icon;
  final double iconSizeRatio;
  final Color? color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
          onPressed: onTap,
          color: color,
          iconSize: 24 * iconSizeRatio,
          highlightColor: kprimary.withOpacity(0.1),
          splashColor: kprimary.withOpacity(0.2),
          icon: Icon(
            icon,
          )),
    );
  }
}
