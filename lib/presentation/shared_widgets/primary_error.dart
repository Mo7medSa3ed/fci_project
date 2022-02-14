import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';

class PrimaryErrorWidget extends StatelessWidget {
  const PrimaryErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PrimaryIcon(
            Icons.error,
            color: Colors.red,
            iconSizeRatio: 4,
          ),
          SizedBox(height: kpadding),
          const PrimaryText(text: generalErrorMsg)
        ],
      ),
    );
  }
}
