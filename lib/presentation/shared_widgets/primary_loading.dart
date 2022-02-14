import 'package:fci_project/main.dart';
import 'package:flutter/cupertino.dart';

class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: kpadding * 2,
    );
  }
}
