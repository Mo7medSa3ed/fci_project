import 'package:fci_project/data/models/order.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, Key? key}) : super(key: key);

  final Order order;

  String calcToTal() {
    num total = 0.0;
    for (var item in order.items!) {
      total += item['price'] * item['amount'];
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(defultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
                text: '\u{25CF}\tتفاصيل المستخدم:',
                fontWeight: FontWeight.w600),
            SizedBox(height: defultPadding),
            buildRowForDetails('الاسم', order.user!['name']),
            buildRowForDetails('الموبايل', order.user!['tel']),
            buildRowForDetails('العنوان', order.user!['address']),
            buildRowForDetails('طريقة الدفع', order.user!['payment']),
            buildRowForDetails('الاجمالى', calcToTal()),
            SizedBox(height: defultPadding),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: PrimaryText(
                text: '\u{25CF}\tتفاصيل الطلب:',
                fontWeight: FontWeight.w600,
              ),
              children: order.items!
                  .map(
                    (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: PrimaryText(
                          text: e['name'],
                          fontSizeRatio: 0.85,
                          maxlines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: PrimaryText(
                          text: 'الكمية: ${e['amount']}  قطع',
                          color: kgrey,
                          fontSizeRatio: 0.8,
                        ),
                        leading: PrimaryImage(
                          url: e['img'],
                          radius: 8,
                          height: defultPadding * 3,
                          fit: BoxFit.cover,
                        ),
                        trailing: PrimaryText(
                          text: '${e['price'] * e['amount']} ج.م',
                        ),
                        onTap: null),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}

Widget buildRowForDetails(title, desc) {
  return Row(
    children: [
      PrimaryText(
        text: '$title :',
        fontWeight: FontWeight.w500,
        color: kwblack,
      ),
      Expanded(
          child: PrimaryText(
              text: '$desc',
              fontSizeRatio: 0.9,
              color: kwblack,
              textAlign: TextAlign.center))
    ],
  );
}
