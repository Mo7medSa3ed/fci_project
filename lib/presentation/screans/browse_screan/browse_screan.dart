import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/browse_screan/widgets/category_card.dart';
import 'package:fci_project/presentation/screans/browse_screan/widgets/filter_page.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/primary_search_widget.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/product_card.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrowseScrean extends StatefulWidget {
  const BrowseScrean({Key? key}) : super(key: key);

  @override
  _BrowseScreanState createState() => _BrowseScreanState();
}

class _BrowseScreanState extends State<BrowseScrean> {
  final TextEditingController _searchController = TextEditingController();
  late ProductProvider _pro;
  @override
  void initState() {
    _pro = Provider.of<ProductProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kpadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(width: kpadding * 2),
              Expanded(
                child: PrimarySearchWidget(
                  controller: _searchController,
                  margin: 0,
                  onSearchPressed: _searchController.text.trim().isEmpty
                      ? null
                      : () => setState,
                  onChange: (String val) {
                    if (val.isEmpty) {
                      setState(() {});
                    } else if (val.length == 1) {
                      setState(() {});
                    }
                  },
                ),
              ),
              if (_searchController.text.isNotEmpty) ...[
                PrimaryIconButton(
                  Icons.filter_alt,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (ctx) => FilterPage()).then((value) {
                      if (value == null) {
                        _pro.clear();
                      } else {
                        setState(() {});
                        return;
                      }
                    });
                  },
                ),
                SizedBox(width: kpadding)
              ]
            ],
          ),
          SizedBox(height: kpadding),
          Expanded(child: _buildList())
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_searchController.text.trim().isEmpty) {
      return PrimaryFutureWidget<List<Category>>(
          future: _pro.getAllCategories(),
          data: (data) {
            return GridView.builder(
                padding: EdgeInsets.all(kpadding * 2),
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150,
                  crossAxisSpacing: kpadding * 2,
                  mainAxisSpacing: kpadding * 2,
                ),
                itemBuilder: (ctx, idx) {
                  return CategoryCard(category: data[idx]);
                });
          });
    } else {
      return PrimaryFutureWidget<List<Product>>(
          future: _pro.searchProduct(_searchController.text.trim()),
          data: (data) {
            if (_pro.saveCategoryListFilter.isNotEmpty) {
              data = data
                  .where((e) =>
                      _pro.saveCategoryListFilter.contains(e.category!.first))
                  .toList();
            }
            return GridView.builder(
                padding: EdgeInsets.all(kpadding * 2),
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: kheight * 0.35,
                  crossAxisSpacing: kpadding * 2,
                  mainAxisSpacing: kpadding * 2,
                ),
                itemBuilder: (ctx, idx) {
                  return ProductCard(product: data[idx]);
                });
          });
    }
  }
}
