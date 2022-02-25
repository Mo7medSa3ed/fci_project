import 'package:fci_project/data/models/order.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/card_item.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, Key? key}) : super(key: key);

  final Order order;

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
            buildRowForDetails('الاسم', currantUser.name),
            buildRowForDetails('الايميل', currantUser.email),
            buildRowForDetails('الموبايل', currantUser.phone),
            buildRowForDetails('العنوان', currantUser.address),
            SizedBox(height: defultPadding),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              title: PrimaryText(
                text: '\u{25CF}\tتفاصيل الطلب:',
                fontWeight: FontWeight.w600,
              ),
              children: List.generate(
                5,
                (index) => BuildListCardForProfileScrean(
                    title: 'منتج 1',
                    image: PrimaryImage(
                      url: networkImage,
                    ),
                    onTap: () {}),
              ),
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
