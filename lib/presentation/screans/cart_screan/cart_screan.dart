import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/cart_screan/widgets/cart_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScrean extends StatelessWidget {
  const CartScrean({Key? key}) : super(key: key);
  Future<Iterable<Product>> getCart(userProvider) async {
    return userProvider.cart.values;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(height: 2),
        Expanded(
          child: PrimaryFutureWidget<Iterable<Product>>(
              beforeReturn: (data) {},
              future: getCart(userProvider),
              data: (data) {
                if (data.isEmpty) {
                  return Center(
                      child: PrimaryText(text: 'لا يوجد منتجات مضافة'));
                }
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: kpadding),
                  itemCount: data.length,
                  itemBuilder: (ctx, idx) => CartCard(data.elementAt(idx)),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PrimaryButton(
            text: 'اذهب الى الحساب',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
