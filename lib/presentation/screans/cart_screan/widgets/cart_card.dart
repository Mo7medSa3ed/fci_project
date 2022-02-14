import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_round_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kpadding),
      padding: EdgeInsets.all(0),
      width: double.infinity,
      height: kheight * 0.15,
      child: Row(
        children: [
          Image.network(
            networkImage,
            height: kheight * 0.1,
          ),
          SizedBox(width: kpadding * 2),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: 'كوكاكولا',
                fontWeight: FontWeight.bold,
              ),
              const PrimaryText(
                text: '325 مللى',
                color: kwblack,
                fontSizeRatio: 0.8,
              ),
              SizedBox(height: kpadding / 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryRoundButton(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        color: kprimary,
                      )),
                  SizedBox(width: kpadding * 2),
                  PrimaryRoundButton(
                      paddingH: kpadding * 1.5,
                      paddingV: 1,
                      child: PrimaryText(
                        text: '5',
                      )),
                  SizedBox(width: kpadding * 2),
                  PrimaryRoundButton(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: kprimary,
                      ))
                ],
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kpadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PrimaryIconButton(
                  Icons.close,
                  onTap: () {},
                ),
                const PrimaryText(
                  text: '500 ج.م',
                  fontWeight: FontWeight.bold,
                  fontSizeRatio: 0.8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
