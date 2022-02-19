import 'dart:math';

import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({required this.favProduct, Key? key}) : super(key: key);
  final Product favProduct;

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserProvider>(context, listen: true);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding:
            EdgeInsets.symmetric(horizontal: kpadding, vertical: kpadding),
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(favProduct
                      .images![Random().nextInt(favProduct.images!.length)]))),
        ),
        title: Row(
          children: [
            Expanded(
              child: PrimaryText(
                text: favProduct.name,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                await pro.addAndRemoveProductToFav(favProduct.id);
              },
              borderRadius: BorderRadius.circular(20),
              child: PrimaryIcon(
                Icons.favorite,
                color: kred,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: PrimaryText(
                text: '${favProduct.amount!.available} قطع',
                color: kwblack,
                fontSizeRatio: 0.8,
              ),
            ),
            PrimaryText(
              text: favProduct.price.toString() + '\tج.م',
              fontSizeRatio: 0.9,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        selected: favProduct.selected ? true : false,
        selectedTileColor: kprimary.withOpacity(0.3),
        onTap: () => pro.changeSelectedForFavProduct(favProduct.id),
      ),
    );
  }
}
