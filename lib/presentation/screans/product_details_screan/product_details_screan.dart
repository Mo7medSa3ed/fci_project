import 'package:fci_project/bussniss_logic/product_provider.dart';
import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/main_screan/widgets/product_section.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/comment_widget.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/expanantial_tile_widget.dart';
import 'package:fci_project/presentation/screans/product_details_screan/widgets/product_carousel.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/screans/store_Screan/store_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_appbar.dart';
import 'package:fci_project/presentation/shared_widgets/primary_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/presentation/shared_widgets/primary_inputfield.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScrean extends StatefulWidget {
  const ProductDetailsScrean(
      {required this.product, required this.uniqueId, Key? key})
      : super(key: key);
  final Product product;
  final String uniqueId;

  @override
  State<ProductDetailsScrean> createState() => _ProductDetailsScreanState();
}

class _ProductDetailsScreanState extends State<ProductDetailsScrean> {
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double rate = 1;
  late ProductProvider pro;

  @override
  void initState() {
    pro = Provider.of<ProductProvider>(context, listen: false);
    pro.getOneProduct(widget.product.id).then((value) {
      if (widget.product.desc == null || (value.rating ?? []).isEmpty) {
        widget.product.desc = value.desc;
        widget.product.rating = value.rating ?? [];
        if (mounted) setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      bottomNavigationBar:
          Consumer<UserProvider>(builder: (context, userProvider, child) {
        return Padding(
          padding: EdgeInsets.all(defultPadding),
          child: PrimaryButton(
            text: 'اضف للسلة',
            onTap: userProvider.isExistInCart(widget.product.id)
                ? null
                : () async {
                    userProvider.addToCart(widget.product);
                  },
          ),
        );
      }),
      body: ListView(
        children: [
          ProductCarousel(
              widget.product.images ?? [], widget.product.id!, widget.uniqueId),
          ListTile(
            title: PrimaryText(
              text: widget.product.name,
              fontSizeRatio: 1.2,
              fontWeight: FontWeight.bold,
            ),
            trailing:
                Consumer<UserProvider>(builder: (context, userProvider, child) {
              bool isFav =
                  userProvider.favProductsIds.contains(widget.product.id);
              return PrimaryIconButton(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? kred : null, onTap: () async {
                if (!isAuth) {
                  return Alert.showAuthAlert();
                }
                await userProvider.addAndRemoveProductFavId(widget.product.id);
              });
            }),
          ),
          SizedBox(height: defultPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defultPadding * 1.1),
            child: Wrap(
              runSpacing: defultPadding / 2,
              alignment: WrapAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: '${widget.product.category!.name}',
                  fontWeight: FontWeight.w500,
                  color: kgrey,
                  onTap: () => Nav.goToScrean(
                      ProductsScrean(category: widget.product.category!)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.store, size: 20, color: kprimary),
                    SizedBox(width: defultPadding / 2),
                    PrimaryText(
                      text: '${widget.product.storeName}',
                      fontWeight: FontWeight.w500,
                      color: kgrey,
                      onTap: () => Nav.goToScrean(StoreDetailsScrean(
                          storeName: widget.product.storeName!)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: defultPadding * 2),
          ListTile(
            trailing: PrimaryText(
              text: '${widget.product.price} ج م',
              fontSizeRatio: 1.2,
              fontWeight: FontWeight.bold,
            ),
            title: StatefulBuilder(
              builder: (context, setState) {
                int totalAmount = widget.product.amount.available.toInt();
                int cartAmount = widget.product.cartAmount;

                return Row(
                  children: [
                    PrimaryIconButton(
                      Icons.add,
                      iconSizeRatio: 1.2,
                      color: kprimary,
                      onTap: cartAmount >= totalAmount
                          ? null
                          : () {
                              if (cartAmount < totalAmount) {
                                widget.product.cartAmount++;
                                setState(() {});
                              }
                            },
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: defultPadding / 2),
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: kwgrey)),
                      child: PrimaryText(
                        text: '${widget.product.cartAmount}',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PrimaryIconButton(Icons.remove,
                        iconSizeRatio: 1.2,
                        color: kprimary,
                        onTap: cartAmount > 1
                            ? () {
                                if (cartAmount > 1) {
                                  widget.product.cartAmount--;
                                  setState(() {});
                                }
                              }
                            : null),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: defultPadding),
          StatefulBuilder(builder: (_, setState) {
            return CustomExpanantialTile(
                isExpand: true,
                title: 'تفاصيل المنتج',
                children: [widget.product.desc ?? ""]);
          }),
          SizedBox(height: defultPadding),
          StatefulBuilder(builder: (context, setState) {
            return CustomExpanantialTile(
              title: 'التعليقات',
              rate: Directionality(
                textDirection: TextDirection.ltr,
                child: RatingBarIndicator(
                  rating: widget.product.rate!.toDouble(),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                  unratedColor: kwgrey,
                ),
              ),
              childrenWidget: [
                ...(widget.product.rating ?? [])
                    .map<Widget>((e) => CommentItem(data: e))
                    .toList(),
                SizedBox(height: defultPadding),
                Form(
                  key: _formKey,
                  child: PrimaryInputField(
                    hintText: 'اكتب تعليقك ...',
                    controller: _commentController,
                    headerText: 'تعليقك',
                    hasTextHeader: false,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: defultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (!isAuth) {
                          return Alert.showAuthAlert();
                        }
                        if (_formKey.currentState!.validate()) {
                          final res = await pro.rateProduct(widget.product.id!,
                              rate, _commentController.text.trim());
                          widget.product.rate = res['rate'];
                          setState(() {});
                        }
                      },
                      child: PrimaryText(
                        text: 'قيم الآن',
                        color: kwhite,
                        fontSizeRatio: 0.8,
                      ),
                    ),
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: RatingBar.builder(
                            initialRating: 1,
                            maxRating: 5,
                            minRating: 1,
                            itemSize: 25,
                            allowHalfRating: true,
                            glowColor: kprimary,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (double rating) {
                              rate = rating;
                              setState(() {});
                            })),
                  ],
                ),
                SizedBox(height: defultPadding)
              ],
            );
          }),
          SizedBox(height: defultPadding),
          PrimaryFutureWidget<Map>(
              future: pro.getAllRecommendedProducts(widget.product.id),
              data: (data) {
                final productsFromSameProvider =
                    data['productsFromSameProvider']
                        .map<Product>((e) => Product.fromJson(e))
                        .toList();
                final usersAlsoWatched = data['usersAlsoWatched']
                    .map<Product>((e) => Product.fromJson(e))
                    .toList();
                final productsFromSameCategory =
                    data['productsFromSameCategory']
                        .map<Product>((e) => Product.fromJson(e))
                        .toList();
                return Column(
                  children: [
                    if (usersAlsoWatched.isNotEmpty) ...[
                      ProductSection(
                          fText: "شاهد العملاء ايضاً",
                          type: 'usersAlsoWatched',
                          products: usersAlsoWatched),
                      SizedBox(height: defultPadding),
                    ],
                    if (productsFromSameCategory.isNotEmpty) ...[
                      ProductSection(
                          fText: "قد يعجبك ايضاً",
                          type: 'productsFromSameCategory',
                          products: productsFromSameCategory),
                      SizedBox(height: defultPadding),
                    ],
                    if (productsFromSameProvider.isNotEmpty) ...[
                      ProductSection(
                          fText: "مزيد من المنتجات",
                          type: 'productsFromSameProvider',
                          products: productsFromSameProvider),
                      SizedBox(height: defultPadding),
                    ]
                  ],
                );
              })
        ],
      ),
    );
  }
}
