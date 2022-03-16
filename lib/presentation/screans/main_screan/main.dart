import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/data/models/home.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/header_text.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/product_card.dart';
import 'package:fci_project/presentation/shared_widgets/app_logo.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _pro = Provider.of<HomeProvider>(context, listen: false);
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
        SizedBox(height: defultPadding),
        Container(
          height: kheight * 0.2,
          margin: EdgeInsets.symmetric(horizontal: kpadding * 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(randomImagesUrl),
                fit: BoxFit.fill,
              )),
        ),
        SizedBox(height: defultPadding),
        PrimaryFutureWidget<Home>(
          future: _pro.getHomePage(),
          data: (data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildProductSection(
                    fText: "الاكثر مشاهدة",
                    lText: "مشاهدة المزيد",
                    onTap: () {},
                    data: data.mostViewedProducts),
                SizedBox(height: defultPadding),
                buildProductSection(
                    fText: "الأعلى تقييماً",
                    lText: "مشاهدة المزيد",
                    onTap: () {},
                    data: data.mostRatedProducts),
                SizedBox(height: defultPadding),
                buildProductSection(
                    fText: "الأكثر طلباً",
                    lText: "مشاهدة المزيد",
                    onTap: () {},
                    data: data.mostOrderedProducts),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildProductSection({
    @required fText,
    @required lText,
    @required onTap,
    @required data,
  }) {
    return SizedBox(
        height: kheight * 0.5,
        child: Column(
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
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 16 / 9),
                itemBuilder: (context, index) {
                  return ProductCard(product: data[index]);
                },
              ),
            )
          ],
        ));
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
