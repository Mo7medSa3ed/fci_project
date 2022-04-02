import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/product_details_screan/product_details_screan.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_round_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {required this.product,
      required this.uniqueId,
      this.enableTabToCategory = false,
      Key? key})
      : super(key: key);

  final Product product;
  final bool enableTabToCategory;
  final String uniqueId;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Nav.goToScrean(ProductDetailsScrean(
          product: widget.product,
          uniqueId: widget.uniqueId,
        )).then((val) => setState(() {}));
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(defultPadding / 4),
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kwgrey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: ObjectKey(widget.uniqueId),
              child: PrimaryImage(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                height: kheight * 0.28,
                fit: BoxFit.fill,
                // url: product.images![Random().nextInt(product.images!.length)],
                url: widget.product.images!.first ?? '',
                radius: 15,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defultPadding / 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    PrimaryText(
                      text: widget.product.name,
                      color: kblack,
                      fontWeight: FontWeight.bold,
                      fontSizeRatio: 0.8,
                      maxlines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: !widget.enableTabToCategory
                                ? null
                                : () => Nav.goToScrean(ProductsScrean(
                                    category: widget.product.category!)),
                            child: PrimaryText(
                              text: '${widget.product.category!.name} ',
                              color: kgrey,
                              fontSizeRatio: 0.8,
                              maxlines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimaryText(
                              text: widget.product.rate.toString(),
                              color: kgrey,
                              fontSizeRatio: 0.8,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: widget.product.rate! > 0
                                  ? Colors.amber
                                  : kgrey,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: defultPadding / 2),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryText(
                            text: '${widget.product.price}' ' ' 'ج م',
                            color: kblack,
                            fontWeight: FontWeight.bold,
                            fontSizeRatio: 0.9,
                            maxlines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Consumer<UserProvider>(
                          builder: (context, userProvider, child) {
                            return PrimaryRoundButton(
                              child: Icon(
                                  userProvider.isExistInCart(widget.product.id)
                                      ? Icons.done
                                      : Icons.add,
                                  color: kwhite),
                              bgColor: kprimary,
                              borderColor: kprimary,
                              overlayColor: kwhite.withOpacity(0.4),
                              onTap: userProvider
                                      .isExistInCart(widget.product.id)
                                  ? null
                                  : () async {
                                      userProvider.addToCart(widget.product);
                                    },
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: defultPadding / 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
