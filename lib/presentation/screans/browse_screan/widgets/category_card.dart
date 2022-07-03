import 'dart:math';

import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {required this.category,
      this.isForInterest = false,
      this.isSelected = false,
      this.onPress,
      Key? key})
      : super(key: key);

  final Category category;
  final bool isForInterest;
  final VoidCallback? onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    int length = Colors.primaries.length;
    final color = Colors.primaries[Random().nextInt(length)];
    return ElevatedButton(
      onPressed: isForInterest
          ? onPress
          : () => Nav.goToScrean(ProductsScrean(category: category)),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: color.withOpacity(0.8), width: 1.8),
              borderRadius: BorderRadius.circular(25))),
          backgroundColor: MaterialStateProperty.all(color.withOpacity(0.09))),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                PrimaryImage(
                  url: category.img!,
                  height: kheight * 0.15,
                  fit: BoxFit.fill,
                ),
                Spacer(),
                PrimaryText(
                  text: category.name,
                  fontWeight: FontWeight.w800,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxlines: 2,
                  fontSizeRatio: 0.9,
                ),
                Spacer(),
              ],
            ),
          ),
          if (isSelected)
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FloatingActionButton(
                  heroTag: ObjectKey(category.id),
                  onPressed: null,
                  elevation: 0,
                  child: PrimaryIcon(
                    Icons.done,
                    iconSizeRatio: 2,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
