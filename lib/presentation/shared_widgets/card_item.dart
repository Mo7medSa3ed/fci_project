import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class BuildListCardForProfileScrean extends StatelessWidget {
  const BuildListCardForProfileScrean({
    required this.title,
    required this.image,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget image;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: defultPadding / 4),
      leading: image,
      trailing: PrimaryIcon(Icons.arrow_forward_ios, color: kwblack),
      title: PrimaryText(
        text: title,
        fontWeight: FontWeight.w500,
        color: kblack.withOpacity(0.8),
      ),
      onTap: onTap,
    );
  }
}
