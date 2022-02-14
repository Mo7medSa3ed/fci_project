import 'dart:math';

import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    int length = Colors.primaries.length;
    final color = Colors.primaries[Random().nextInt(length)];
    return ElevatedButton(
      onPressed: () => Nav.goToScrean(ProductsScrean(category: category)),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: color.withOpacity(0.8), width: 1.8),
              borderRadius: BorderRadius.circular(25))),
          backgroundColor: MaterialStateProperty.all(color.withOpacity(0.09))),
      child: PrimaryText(
        text: category.name,
        fontWeight: FontWeight.w800,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxlines: 2,
        fontSizeRatio: 1,
      ),
    );
  }
}
