import 'package:fci_project/helper/constants.dart';
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
    if ((data['comment'].toString().trim()).isEmpty) return SizedBox();
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
            Row(
              children: [
                PrimaryText(
                  text: data['rate'].toString(),
                  fontSizeRatio: 0.8,
                ),
                SizedBox(width: 4),
                PrimaryIcon(
                  Icons.star,
                  color: Colors.amber,
                  iconSizeRatio: 0.5,
                ),
              ],
            ),
          ],
        ),
        subtitle: Text((data['comment'] ?? '').toString()),
        trailing: getEmoji(data['msg']) != null
            ? PrimaryIcon(getEmoji(data['msg']),
                iconSizeRatio: 1.2, color: getEmojiColor(data['msg']))
            : null);
  }
}
