import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/orders/order_screan.dart';
import 'package:fci_project/presentation/screans/support_screan/help.dart';
import 'package:fci_project/presentation/shared_widgets/card_item.dart';
import 'package:fci_project/presentation/screans/register_screan/register_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(defultPadding),
      children: [
        Row(
          children: [
            PrimaryImage(
              url: assetImage,
              height: kheight * 0.07,
              radius: 10,
            ),
            SizedBox(width: defultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryText(
                  text: currantUser.name,
                  fontWeight: FontWeight.w500,
                ),
                PrimaryText(
                  text: currantUser.email,
                  fontWeight: FontWeight.w500,
                  fontSizeRatio: 0.9,
                  color: kgrey,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: defultPadding),
        Divider(height: defultPadding / 2),
        BuildListCardForProfileScrean(
            title: 'تعديل حسابك',
            image: PrimaryIcon(Icons.edit_outlined, color: kblack),
            onTap: () => Nav.goToScrean(
                  RegisterScrean(edit: true),
                )),
        Divider(height: defultPadding / 2),
        BuildListCardForProfileScrean(
          title: 'طلباتى',
          image: PrimaryIcon(Icons.shopping_bag_outlined, color: kblack),
          onTap: () => Nav.goToScrean(OrderScrean()),
        ),
        Divider(height: defultPadding / 2),
        BuildListCardForProfileScrean(
          title: 'تواصل معنا',
          image: PrimaryIcon(Icons.error_outline, color: kblack),
          onTap: () => Nav.goToScrean(HelpScrean()),
        ),
        Divider(height: 0),
        BuildListCardForProfileScrean(
          title: 'تسجيل خروج',
          image: PrimaryIcon(Icons.logout, color: kblack),
          onTap: () async => await logout(),
        ),
      ],
    );
  }
}
