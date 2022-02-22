import 'package:fci_project/bussniss_logic/order_provider.dart';
import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/cart_screan/widgets/cart_card.dart';
import 'package:fci_project/presentation/screans/register_screan/widgets/click_text.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/presentation/shared_widgets/success_order_dialog.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScrean extends StatelessWidget {
  const CartScrean({Key? key}) : super(key: key);
  Future<Iterable<Product>> getCart(UserProvider userProvider) async {
    return userProvider.cart.values;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                  itemBuilder: (ctx, idx) => CartCard(
                    data.elementAt(idx),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PrimaryButton(
            text: 'اذهب الى الحساب',
            onTap: () async {
              final total = userProvider.calcTotalCart();
              return await checkOutSheet(context, total, userProvider);
            },
          ),
        ),
      ],
    );
  }

  Future<void> checkOutSheet(
      context, double total, UserProvider userProvider) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      )),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(defultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const PrimaryText(
                  text: 'الحساب',
                  fontWeight: FontWeight.bold,
                  fontSizeRatio: 1.1,
                ),
                PrimaryIconButton(
                  Icons.close,
                  onTap: () => Nav.pop(),
                )
              ]),
              SizedBox(height: defultPadding),
              Divider(height: defultPadding, color: kgrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                      text: 'الإجمالى',
                      color: kgrey,
                      fontWeight: FontWeight.w500),
                  PrimaryText(text: '$total ج.م'),
                ],
              ),
              Divider(height: defultPadding, color: kgrey),
              SizedBox(height: defultPadding * 1.2),
              ClickText(
                firstText: 'بالاستمرار انت توافق على',
                clickText: 'شروط الخدمة و سياسة الاستخدام',
                sizeRatio: 0.6,
                center: false,
              ),
              SizedBox(height: defultPadding * 1.2),
              PrimaryButton(
                  text: 'اطلب الآن',
                  onTap: () async {
                    Nav.pop();
                    final orderProvider = context.read<OrderProvider>();
                    await orderProvider.makeOrder();
                    userProvider.clearCart();
                    return Nav.goToScreanWithReplaceMent(SuccessOrder());
                  })
            ],
          ),
        );
      },
    );
  }
}
