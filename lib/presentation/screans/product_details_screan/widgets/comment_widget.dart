import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.data}) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: kprimary.withOpacity(0.9),
        child: PrimaryIcon(Icons.person, color: kwhite),
      ),
      title: Text(data['userId']['name'].toString()),
      subtitle: Text(
        (data['comment'] ?? '').toString(),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryText(text: data['rate'].toString()),
          SizedBox(width: defultPadding / 2),
          PrimaryIcon(
            Icons.star,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
