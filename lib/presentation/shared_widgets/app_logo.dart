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
          ),
        ],
      ),
    );
  }
}
