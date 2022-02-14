import 'package:fci_project/main.dart';
import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.ratio = 0.07}) : super(key: key);
  final double ratio;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fill,
        height: kheight * ratio,
        width: kheight * ratio,
      ),
    );
  }
}
