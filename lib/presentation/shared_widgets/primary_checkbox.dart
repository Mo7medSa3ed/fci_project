import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';

import 'package:fci_project/style/colors.dart';
import 'package:fci_project/style/text_style.dart';
import 'package:flutter/material.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox(
      {Key? key, this.value = false, this.onchange, this.text})
      : super(key: key);

  final bool? value;
  final dynamic onchange;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(border: Border.all(color: kprimary)),
          child: Checkbox(
            value: value ?? false,
            onChanged: onchange,
          ),
        ),
        if (text != null && text!.isNotEmpty) ...[
          SizedBox(width: defultPadding / 2),
          PrimaryText(
            text:text ?? '',
            textStyle: TStyle.customTextStyle(),
          )
        ]
      ],
    );
  }
}
