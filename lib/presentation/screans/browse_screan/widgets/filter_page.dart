import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pro = Provider.of<ProductProvider>(context, listen: false);
    return SizedBox(
      height: kheight - 23,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kpadding * 2),
            child: Row(
              children: [
                Expanded(
                  child: PrimaryText(
                    text: 'الفلاتر',
                    fontWeight: FontWeight.bold,
                    fontSizeRatio: 1.2,
                    textAlign: TextAlign.center,
                  ),
                ),
                PrimaryIconButton(
                  Icons.close,
                  onTap: () => close(_pro),
                )
              ],
            ),
          ),
          SizedBox(height: kpadding),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kpadding * 2),
              decoration: BoxDecoration(
                  color: kwgrey.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PrimaryText(
                    text: 'التصنيفات',
                    fontWeight: FontWeight.bold,
                    fontSizeRatio: 1.2,
                  ),
                  SizedBox(height: kpadding),
                  Expanded(
                      child: PrimaryFutureWidget<List<Category>>(
                    future: _pro.getAllCategories(),
                    beforeReturn: (data) {
                      _pro.initCategories(data);
                    },
                    data: (data) {
                      return Consumer<ProductProvider>(
                          builder: (ctx, productProvider, c) {
                        return ListView.builder(
                            itemCount: productProvider.categories.length,
                            itemBuilder: (ctx, idx) {
                              return Directionality(
                                textDirection: TextDirection.ltr,
                                child: CheckboxListTile(
                                  value: productProvider.saveCategoryListFilter
                                      .contains(
                                          productProvider.categories[idx].id),
                                  checkColor: kwhite,
                                  activeColor: kprimary,
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  title: PrimaryText(
                                    text: productProvider.categories[idx].name,
                                    textAlign: TextAlign.end,
                                  ),
                                  onChanged: (bool? val) {
                                    productProvider.changeSelectedCategory(
                                        productProvider.categories[idx].id!);
                                    _pro.addToCategoryListFilter(data[idx].id!);
                                  },
                                ),
                              );
                            });
                      });
                    },
                  )),
                  SizedBox(
                    width: kweidth * 0.8,
                    child: PrimaryButton(
                        text: 'حفظ',
                        onTap: () {
                          Nav.pop(val: true);
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  close(ProductProvider pro) {
    pro.categories.clear();
    pro.saveCategoryListFilter.clear();
    Nav.pop();
  }
}
