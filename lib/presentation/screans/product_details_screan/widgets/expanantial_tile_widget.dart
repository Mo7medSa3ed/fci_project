import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CustomExpanantialTile extends StatelessWidget {
  const CustomExpanantialTile(
      {@required this.title,
      @required this.children,
      this.isExpand = false,
      Key? key})
      : super(key: key);
  final String? title;
  final List<String>? children;
  final bool isExpand;

  //'تفاصيل المنتج',
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isExpand,
      expandedAlignment: Alignment.centerRight,
      childrenPadding: EdgeInsets.symmetric(horizontal: defultPadding),
      title: PrimaryText(
        text: title,
        fontWeight: FontWeight.bold,
      ),
      children: List<Widget>.generate(
            children!.length,
            (index) => PrimaryText(
              text: children![index],
              fontWeight: FontWeight.w500,
              color: kgrey,
            ),
          ) +
          [SizedBox(height: defultPadding)],
    );
  }
}
