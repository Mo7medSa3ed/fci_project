import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/header_text.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/primary_search_widget.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/product_card.dart';
import 'package:fci_project/presentation/shared_widgets/app_logo.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (x, c) {
      return ListView(
        padding: EdgeInsets.symmetric(vertical: kpadding / 2),
        children: [
          AppLogo(ratio: 0.04),
          SizedBox(height: defultPadding / 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryIcon(
                Icons.location_on,
              ),
              SizedBox(width: defultPadding / 4),
              Flexible(
                child: PrimaryText(
                  text: 'منيا القمح,الشرقية',
                  fontSizeRatio: 0.8,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  maxlines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: defultPadding / 2),
          PrimarySearchWidget(
            onChange: (String val) {},
          ),
          SizedBox(height: defultPadding),
          Container(
            height: (kheight + kweidth) * 0.08,
            margin: EdgeInsets.symmetric(horizontal: kpadding * 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(networkImage), fit: BoxFit.fill)),
          ),
          SizedBox(height: defultPadding),
        ],
      );
    });
  }

  Widget buildProductSection({
    @required fText,
    @required lText,
    @required onTap,
    @required data,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kpadding * 2),
          child: HeaderText(
            fText: fText ?? '',
            lText: lText ?? '',
            onTap: onTap,
          ),
        ),
        SizedBox(height: defultPadding / 1.5),
        buildProductCarousel(
          data ?? [],
        ),
      ],
    );
  }

  Widget buildProductCarousel(List<Product> data) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kpadding),
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: (data).map((e) => ProductCard(product: e)).toList(),
      ),
    );
  }
}
