import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/expanantial_tile_widget.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/product_carousel.dart';
import 'package:fci_project/presentation/shared_widgets/primary_appbar.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScrean extends StatelessWidget {
  const ProductDetailsScrean({required this.product, Key? key})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProductProvider>(context, listen: false);
    double rate = 1;
    pro.getOneProduct(product.id);
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: ListView(
        children: [
          ProductCarousel(product.images ?? [], product.id!),
          ListTile(
            title: PrimaryText(
              text: product.name,
              fontSizeRatio: 1.2,
              fontWeight: FontWeight.bold,
            ),
            subtitle: PrimaryText(
              text: '${product.amount.available} قطع',
              fontWeight: FontWeight.bold,
              color: kgrey,
            ),
            trailing:
                Consumer<UserProvider>(builder: (context, userProvider, child) {
              bool isFav = userProvider.favProductsIds.contains(product.id);
              return PrimaryIconButton(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? kred : null, onTap: () async {
                if (!isAuth) {
                  return Alert.showAuthAlert();
                }
                await userProvider.addAndRemoveProductFavId(product.id);
              });
            }),
          ),
          SizedBox(height: defultPadding * 2),
          ListTile(
            trailing: PrimaryText(
              text: '${product.price} ج م',
              fontSizeRatio: 1.2,
              fontWeight: FontWeight.bold,
            ),
            title: StatefulBuilder(
              builder: (context, setState) {
                int totalAmount = product.amount.available.toInt();
                int cartAmount = product.cartAmount;

                return Row(
                  children: [
                    PrimaryIconButton(
                      Icons.add,
                      iconSizeRatio: 1.2,
                      color: kprimary,
                      onTap: cartAmount >= totalAmount
                          ? null
                          : () {
                              if (cartAmount < totalAmount) {
                                product.cartAmount++;
                                setState(() {});
                              }
                            },
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: defultPadding / 2),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: kwgrey)),
                      child: PrimaryText(
                        text: '${product.cartAmount}',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PrimaryIconButton(Icons.remove,
                        iconSizeRatio: 1.2,
                        color: kprimary,
                        onTap: cartAmount > 1
                            ? () {
                                if (cartAmount > 1) {
                                  product.cartAmount--;
                                  setState(() {});
                                }
                              }
                            : null),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: defultPadding),
          CustomExpanantialTile(
              isExpand: true,
              title: 'تفاصيل المنتج',
              children: [product.desc!]),
          SizedBox(height: defultPadding),
          StatefulBuilder(builder: (context, setState) {
            return CustomExpanantialTile(
              title: 'التعليقات',
              rate: Directionality(
                textDirection: TextDirection.ltr,
                child: RatingBarIndicator(
                  rating: product.rate!.toDouble(),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                  unratedColor: kwgrey,
                ),
              ),
              childrenWidget: [
                SizedBox(height: defultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (!isAuth) {
                          return Alert.showAuthAlert();
                        }
                        final res = await pro.rateProduct(product.id!, rate);
                        product.rate = res['rate'];
                        setState(() {});
                      },
                      child: PrimaryText(
                        text: 'قيم الآن',
                        color: kwhite,
                        fontSizeRatio: 0.8,
                      ),
                    ),
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: RatingBar.builder(
                            initialRating: 1,
                            maxRating: 5,
                            minRating: 1,
                            itemSize: 25,
                            allowHalfRating: true,
                            glowColor: kprimary,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (double rating) {
                              rate = rating;
                              setState(() {});
                            })),
                  ],
                ),
                SizedBox(height: defultPadding)
              ],
            );
          }),
          SizedBox(height: defultPadding),
          Consumer<UserProvider>(builder: (context, userProvider, child) {
            return Padding(
              padding: EdgeInsets.all(defultPadding),
              child: PrimaryButton(
                text: 'اضف للسلة',
                onTap: userProvider.isExistInCart(product.id)
                    ? null
                    : () async {
                        userProvider.addToCart(product);
                      },
              ),
            );
          })
        ],
      ),
    );
  }
}
