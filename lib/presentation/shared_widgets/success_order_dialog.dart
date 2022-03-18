import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:fci_project/presentation/screans/orders/order_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_image.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrimaryImage(
            url: 'assets/images/sOrder.png',
            fit: BoxFit.cover,
            height: kheight * 0.45,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(defultPadding * 2.2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    PrimaryText(
                      text: 'تم ارسال الطلب بنجاح',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSizeRatio: 1.8,
                      color: kblack.withOpacity(0.8),
                    ),
                    PrimaryText(
                      text: 'منتجاتك تم تدوينها و سوف يتم تجهيزها ف الحال',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSizeRatio: 1,
                      color: kgrey,
                    ),
                    Spacer(),
                    PrimaryButton(
                        text: 'الذهاب للطلب',
                        onTap: () {
                          Nav.goToScreanAndRemoveUntill(HomeScrean());
                          Nav.goToScrean(OrderScrean());
                        }),
                    SizedBox(height: defultPadding),
                    PrimaryButton(
                        text: 'الرجوع للرئيسئة',
                        outline: true,
                        onTap: () =>
                            Nav.goToScreanAndRemoveUntill(HomeScrean()))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
