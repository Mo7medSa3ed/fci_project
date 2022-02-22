import 'dart:math';

import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_round_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: EdgeInsets.all(kpadding),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: kheight * 0.15,
        child: Row(
          children: [
            PrimaryImage(
              url: product.images!.first,
              height: kheight * 0.1,
              radius: 15,
            ),
            SizedBox(width: kpadding * 2),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: product.name,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: kpadding),
                Consumer<UserProvider>(builder: (context, userProvider, child) {
                  int totalAmount = product.amount.available.toInt();
                  int cartAmount = product.cartAmount;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PrimaryRoundButton(
                          onTap: cartAmount >= totalAmount
                              ? null
                              : () {
                                  if (cartAmount < totalAmount) {
                                    userProvider.addAmount(product.id);
                                  }
                                },
                          child: Icon(
                            Icons.add,
                            color: cartAmount >= totalAmount
                                ? kgrey[350]
                                : kprimary,
                          )),
                      SizedBox(width: kpadding * 2),
                      PrimaryRoundButton(
                          paddingH: kpadding,
                          paddingV: 1,
                          child: PrimaryText(
                            text: '${product.cartAmount}',
                          )),
                      SizedBox(width: kpadding * 2),
                      PrimaryRoundButton(
                          onTap: cartAmount > 1
                              ? () {
                                  if (cartAmount > 1) {
                                    userProvider.minusAmount(product.id);
                                  }
                                }
                              : null,
                          child: Icon(
                            Icons.remove,
                            color: cartAmount > 1 ? kprimary : kgrey[350],
                          ))
                    ],
                  );
                })
              ],
            )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kpadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PrimaryIconButton(
                    Icons.close,
                    onTap: () {
                      Alert.showConfirmDialog(context,
                          title: 'عربة التسوق',
                          desc: 'هل انت متأكد من حذف المنتج من السلة؟',
                          onTap: () {
                        userProvider.removeFromCart(product.id!);
                        Nav.pop();
                      });
                    },
                  ),
                  PrimaryText(
                    text: '${product.price} ج.م',
                    fontWeight: FontWeight.bold,
                    fontSizeRatio: 0.8,
                  ),
                  SizedBox(width: kpadding * 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
