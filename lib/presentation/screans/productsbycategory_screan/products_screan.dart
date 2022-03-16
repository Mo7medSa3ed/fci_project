import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/product_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScrean extends StatelessWidget {
  const ProductsScrean({required this.category, Key? key}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    final _pro = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: PrimaryText(
            text: category.name,
            fontWeight: FontWeight.bold,
          ),
          leading: PrimaryIconButton(
            Icons.arrow_back_ios,
            color: kblack,
            onTap: () => Nav.pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: PrimaryFutureWidget<List<Product>>(
              future: _pro.searchProductByCategory(category.id!),
              data: (products) {
                if (products.isEmpty) {
                  return Center(child: PrimaryText(text: 'لا يوجد منتجات'));
                }
                return GridView.builder(
                    padding: EdgeInsets.all(kpadding),
                    physics: BouncingScrollPhysics(),
                    itemCount: products.length,
                    primary: true,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: kheight * 0.45,
                      crossAxisSpacing: kpadding,
                      mainAxisSpacing: kpadding,
                    ),
                    itemBuilder: (ctx, idx) =>
                        ProductCard(product: products[idx]));
              }),
        ));
  }
}
