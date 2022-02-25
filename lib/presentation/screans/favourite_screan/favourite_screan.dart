import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/favourite_screan/widgets/favourite_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScrean extends StatefulWidget {
  const FavouriteScrean({Key? key}) : super(key: key);

  @override
  State<FavouriteScrean> createState() => _FavouriteScreanState();
}

class _FavouriteScreanState extends State<FavouriteScrean> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PrimaryFutureWidget<List<Product>>(
              beforeReturn: (data) {
                pro.initFavProducts(data);
              },
              future: pro.getAllFavouriteProducts(),
              data: (data) {
                return Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                  if (userProvider.favProducts.isEmpty) {
                    return Center(
                        child: PrimaryText(text: 'لا يوجد منتجات مضافة'));
                  }

                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: kpadding),
                    itemCount: userProvider.favProducts.length,
                    itemBuilder: (ctx, idx) => FavouriteCard(
                        favProduct: userProvider.favProducts[idx]),
                  );
                });
              }),
        ),
        Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            int selectedFavLength =
                userProvider.getSelectedFavProducts().length;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                text:
                    'اضافة ${selectedFavLength != 0 ? '\t$selectedFavLength\t' : ''} للسلة',
                onTap: selectedFavLength == 0 ? null : () {},
              ),
            );
          },
        )
      ],
    );
  }
}
