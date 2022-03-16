import 'package:fci_project/main.dart';
import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.ratio = 0.07}) : super(key: key);
  final double ratio;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
            height: kheight * ratio,
            width: kheight * ratio,
          ),
          // SizedBox(height: defultPadding / 2),
          // PrimaryText(
          //   text: 'السوق الإلكترونى',
          //   fontWeight: FontWeight.w600,
          //   fontSizeRatio: 0.8,
          // )
        ],
      ),
    );
  }
}
