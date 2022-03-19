import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/category_home_card.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection(
      {required this.categories,
      this.fText = '',
      this.lText = '',
      this.onTap,
      Key? key})
      : super(key: key);
  final String fText;
  final String lText;
  final VoidCallback? onTap;
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kheight * 0.2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kpadding * 2),
            child: HeaderText(
              fText: fText,
              lText: lText,
              onTap: onTap,
            ),
          ),
          SizedBox(height: defultPadding / 1.5),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: defultPadding / 2),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: (categories).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: kweidth * 0.7,
            ),
            itemBuilder: (context, index) {
              return CategoryHomeCard(category: categories[index]);
            },
          )),
        ],
      ),
    );
  }
}
