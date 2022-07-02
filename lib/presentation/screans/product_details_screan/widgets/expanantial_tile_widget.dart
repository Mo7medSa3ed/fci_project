import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CustomExpanantialTile extends StatelessWidget {
  const CustomExpanantialTile(
      {@required this.title,
      this.children,
      this.rate,
      this.isExpand = false,
      this.childrenWidget,
      Key? key})
      : super(key: key);
  final String? title;
  final Widget? rate;
  final List<String>? children;
  final List<Widget>? childrenWidget;
  final bool isExpand;

  //'تفاصيل المنتج',
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isExpand,
      expandedAlignment: Alignment.centerRight,
      childrenPadding: EdgeInsets.symmetric(horizontal: defultPadding),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: title,
            fontWeight: FontWeight.bold,
          ),
          rate ?? SizedBox()
        ],
      ),
      children: childrenWidget ??
          List<Widget>.generate(
                children!.length,
                (index) => PrimaryText(
                  text: children![index],
                  fontWeight: FontWeight.w500,
                  fontSizeRatio: 0.8,
                  color: kgrey,
                ),
              ) +
              [SizedBox(height: defultPadding)],
    );
  }
}
