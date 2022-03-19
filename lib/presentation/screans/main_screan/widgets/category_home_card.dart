import 'dart:math';

import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({required this.category, Key? key}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    int length = Colors.primaries.length;
    final color = Colors.primaries[Random().nextInt(length)];
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defultPadding / 2),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(defultPadding),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: defultPadding / 2),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35,
            backgroundImage: NetworkImage(
              category.img!,
            ),
          ),
          SizedBox(width: defultPadding),
          Expanded(
            child: PrimaryText(
              text: category.name ?? '',
              color: kblack,
              fontSizeRatio: 0.9,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
