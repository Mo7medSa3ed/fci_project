import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/cart_screan/widgets/cart_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CartScrean extends StatelessWidget {
  const CartScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(height: 2),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: kpadding),
              itemCount: 20,
              itemBuilder: (ctx, idx) => CartCard()),
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
