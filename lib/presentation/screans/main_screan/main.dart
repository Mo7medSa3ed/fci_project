import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/data/models/home.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/categories_section.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/product_section.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _pro = Provider.of<HomeProvider>(context, listen: false);
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: kpadding / 2),
      children: [
        SizedBox(height: defultPadding),
        Container(
          height: kheight * 0.2,
          margin: EdgeInsets.symmetric(horizontal: kpadding * 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/offer_ramadan.jpg'),
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
                CategoriesSection(
                  fText: "التصنيفات",
                  lText: "مشاهدة المزيد",
                  onTap: () => _pro.changeIndexForHome(1),
                  categories: data.categories,
                ),
                SizedBox(height: defultPadding),
                ProductSection(
                    fText: "الاكثر مشاهدة",
                    lText: "مشاهدة المزيد",
                    type: 'mostViewedProducts',
                    onTap: () => Nav.goToScrean(ProductsScrean(
                        category: Category(), type: 'mostViewedProducts')),
                    products: data.mostViewedProducts),
                SizedBox(height: defultPadding),
                ProductSection(
                    fText: "الأعلى تقييماً",
                    lText: "مشاهدة المزيد",
                    type: 'mostRatedProducts',
                    onTap: () => Nav.goToScrean(ProductsScrean(
                        category: Category(), type: 'mostRatedProducts')),
                    products: data.mostRatedProducts),
                SizedBox(height: defultPadding),
                ProductSection(
                    fText: "الأكثر طلباً",
                    lText: "مشاهدة المزيد",
                    type: 'mostOrderedProducts',

                    onTap: () => Nav.goToScrean(ProductsScrean(
                        category: Category(), type: 'mostOrderedProducts')),
                    products: data.mostOrderedProducts),
                SizedBox(height: defultPadding),
                ProductSection(
                    fText: "الأكثر اعجاباً",
                    lText: "مشاهدة المزيد",
                    type: 'mostLovedProducts',
                    onTap: () => Nav.goToScrean(ProductsScrean(
                        category: Category(), type: 'mostLovedProducts')),
                    products: data.mostLovedProducts),
              ],
            );
          },
        ),
      ],
    );
  }
}
