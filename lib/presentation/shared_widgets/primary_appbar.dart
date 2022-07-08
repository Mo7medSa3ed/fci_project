import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PrimaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  PrimaryAppBar({this.shareLink = '', Key? key}) : super(key: key);

  final String shareLink;

  @override
  final Size preferredSize = Size(double.infinity, 60);
  @override
  _PrimaryAppBarState createState() => _PrimaryAppBarState();
}

class _PrimaryAppBarState extends State<PrimaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 10, left: 8, right: 8),
      color: Colors.black87.withOpacity(0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryIconButton(
            Icons.share,
            onTap: widget.shareLink.isEmpty
                ? null
                : () async {
                    await Share.share(
                        "https://fci-proj.herokuapp.com/store/product/" +
                            widget.shareLink);
                  },
          ),
          PrimaryIconButton(
            Icons.arrow_forward_ios,
            onTap: () => Nav.pop(),
          ),
        ],
      ),
    );
  }
}
