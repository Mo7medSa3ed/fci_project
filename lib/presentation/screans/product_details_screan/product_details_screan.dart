import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/expanantial_tile_widget.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/product_carousel.dart';
import 'package:fci_project/presentation/shared_widgets/primary_appbar.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScrean extends StatelessWidget {
  const ProductDetailsScrean({required this.product, Key? key})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    num price = product.price!;
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: ListView(
        children: [
          ProductCarousel(product.images ?? [], product.id!),
          ListTile(
            title: PrimaryText(
              text: product.name,
              fontSizeRatio: 2,
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
                  color: isFav ? kred : null,
                  onTap: () async =>
                      await userProvider.addAndRemoveProductFavId(product.id));
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
              builder: (context, setState) => Row(
                children: [
                  PrimaryIconButton(Icons.add,
                      iconSizeRatio: 1.2,
                      color: kprimary,
                      onTap: product.price! < price
                          ? () {
                              if (product.price! < price) {
                                product.price = product.price! + 1;
                                setState(() {});
                              }
                            }
                          : null),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: defultPadding / 2),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: kwgrey)),
                    child: PrimaryText(
                      text: '${product.price}',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PrimaryIconButton(Icons.remove,
                      iconSizeRatio: 1.2,
                      color: kprimary,
                      onTap: product.price! > 0
                          ? () {
                              if (product.price! > 0) {
                                product.price = product.price! - 1;
                                setState(() {});
                              }
                            }
                          : null),
                ],
              ),
            ),
          ),
          SizedBox(height: defultPadding),
          CustomExpanantialTile(
              isExpand: true,
              title: 'تفاصيل المنتج',
              children: [product.desc!]),
          SizedBox(height: defultPadding),
          CustomExpanantialTile(
              title: 'سكريات',
              children: const ['منتج جامد جدا و فريش و انصح الناس بتجربته']),
          SizedBox(height: defultPadding),
          CustomExpanantialTile(
              title: 'التعليقات',
              children: const ['منتج جامد جدا و فريش و انصح الناس بتجربته']),
          SizedBox(height: defultPadding),
          Padding(
            padding: EdgeInsets.all(defultPadding),
            child: PrimaryButton(
              text: 'اضف للسلة',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
