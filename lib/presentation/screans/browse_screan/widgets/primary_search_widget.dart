import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class PrimarySearchWidget extends StatelessWidget {
  const PrimarySearchWidget({
    Key? key,
    @required this.onChange,
    this.controller,
    this.margin,
    this.onSearchPressed,
  }) : super(key: key);

  final double? margin;
  final Function? onChange;
  final VoidCallback? onSearchPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? kpadding * 2),
      decoration: BoxDecoration(
          color: kwgrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        onChanged: (String val) => onChange!(val),
        maxLength: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'ابحث هنا ...',
          counterText: '',
          prefixIcon: IconButton(
            icon: const PrimaryIcon(Icons.search),
            onPressed: onSearchPressed ?? () {},
          ),
        ),
      ),
    );
  }
}
