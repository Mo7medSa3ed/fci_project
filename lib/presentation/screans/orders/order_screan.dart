import 'package:fci_project/bussniss_logic/order_provider.dart';
import 'package:fci_project/data/models/order.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/orders/order_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScrean extends StatelessWidget {
  const OrderScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<OrderProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: kgrey.shade100,
        appBar: customAppBar('طلباتى', back: true),
        body: PrimaryFutureWidget<List<Order>>(
            beforeReturn: (orders) {},
            future: pro.getAllOrders(),
            data: (orders) {
              if (orders.isEmpty) {
                return Center(child: PrimaryText(text: 'ليس لديك طلبات'));
              }
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: kpadding),
                itemCount: orders.length,
                itemBuilder: (ctx, idx) => OrderCard(order: orders[idx]),
              );
            }));
  }
}
