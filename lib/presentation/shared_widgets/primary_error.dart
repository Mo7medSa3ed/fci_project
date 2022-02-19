import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';

class PrimaryErrorWidget extends StatelessWidget {
  const PrimaryErrorWidget({this.iconRatiaSize = 4,  this.hasText=true ,Key? key})
      : super(key: key);
  final double iconRatiaSize;
  final bool hasText ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryIcon(
            Icons.error,
            color: Colors.red,
            iconSizeRatio: iconRatiaSize.toDouble(),
          ),
          if(hasText)
          ...[
          SizedBox(height: kpadding),
          const PrimaryText(text: generalErrorMsg)
          ]
        ],
      ),
    );
  }
}
