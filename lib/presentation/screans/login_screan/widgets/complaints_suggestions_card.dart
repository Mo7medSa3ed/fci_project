import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class ComplaintsAndSuggestionsCard extends StatelessWidget {
  const ComplaintsAndSuggestionsCard(this.data, {Key? key}) : super(key: key);
  final Map data;
  getColor() {
    return data['msgType'] == 'شكوى'
        ? kred
        : data['msgType'] == 'اقتراح'
            ? kprimary
            : Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: PrimaryText(text: data['msg']),
        subtitle: PrimaryText(text: data['state']),
        trailing: PrimaryText(
          text: data['msgType'],
          fontWeight: FontWeight.bold,
          color: getColor(),
        ),
        leading: CircleAvatar(backgroundColor: getColor()),
      ),
    );
  }
}
