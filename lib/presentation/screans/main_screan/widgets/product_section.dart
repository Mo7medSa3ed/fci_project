import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/header_text.dart';
import 'package:fci_project/presentation/shared_widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  const ProductSection(
      {this.fText = '',
      this.lText = '',
      this.onTap,
      required this.type,
      this.products,
      Key? key})
      : super(key: key);
  final String fText;
  final String lText;
  final String type;
  final VoidCallback? onTap;
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kheight * 0.52,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kpadding * 2),
              child: HeaderText(
                fText: fText,
                lText: lText,
                onTap: onTap,
              ),
            ),
            SizedBox(height: defultPadding / 1.5),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: (products ?? []).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 16 / 9,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products![index],
                    enableTabToCategory: true,
                    uniqueId: '$type$index',
                  );
                },
              ),
            )
          ],
        ));
  }
}
