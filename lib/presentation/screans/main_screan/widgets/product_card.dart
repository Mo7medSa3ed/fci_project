import 'dart:math';

import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/product_details_screan/product_details_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_round_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, Key? key}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Nav.goToScrean(ProductDetailsScrean(product:product)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(defultPadding / 4),
        padding: EdgeInsets.all(defultPadding * 0.8),
        height: kheight * 0.35,
        width: kheight * 0.24,
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: kwgrey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Hero(
                  tag: ObjectKey(product.id),
                  child: PrimaryImage(
                    url: product
                        .images![Random().nextInt(product.images!.length)],
                  ),
                )),
            PrimaryText(
              text: product.name,
              color: kblack,
              fontWeight: FontWeight.bold,
            ),
            PrimaryText(
              text: '${product.amount!.available} قطع',
              color: kgrey,
              fontSizeRatio: 0.8,
            ),
            SizedBox(height: defultPadding / 1.5),
            Row(
              children: [
                Expanded(
                  child: PrimaryText(
                    text: '${product.price}' ' ' 'ج م',
                    color: kblack,
                    fontWeight: FontWeight.bold,
                    fontSizeRatio: 0.9,
                  ),
                ),
                PrimaryRoundButton(
                  child: Icon(Icons.add, color: kwhite),
                  bgColor: kprimary,
                  borderColor: kprimary,
                  overlayColor: kwhite.withOpacity(0.4),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
