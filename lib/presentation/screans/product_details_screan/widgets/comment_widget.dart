import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.data, this.symentText = ''})
      : super(key: key);
  final Map data;
  final String? symentText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: kprimary.withOpacity(0.9),
          child: PrimaryIcon(Icons.person, color: kwhite),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data['userId']['name'].toString()),
            SizedBox(width: defultPadding),
            ...List.generate(
                data['rate'],
                (index) => PrimaryIcon(
                      Icons.star,
                      color: Colors.amber,
                      iconSizeRatio: 0.5,
                    )),
          ],
        ),
        subtitle: Text((data['comment'] ?? '').toString()),
        trailing: getEmoji(symentText ?? '') != null
            ? PrimaryIcon(getEmoji(symentText ?? ''),
                iconSizeRatio: 1.2, color: getEmojiColor(symentText ?? ''))
            : null);
  }
}
