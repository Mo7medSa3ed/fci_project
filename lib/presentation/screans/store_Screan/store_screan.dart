import 'package:carousel_slider/carousel_slider.dart';
import 'package:fci_project/bussniss_logic/store_provider.dart';
import 'package:fci_project/data/models/store.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/productsbycategory_screan/products_screan.dart';
import 'package:fci_project/presentation/shared_widgets/primary_future_widget.dart';
import 'package:fci_project/presentation/shared_widgets/primary_inputfield.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/presentation/shared_widgets/product_card.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class StoreDetailsScrean extends StatelessWidget {
  StoreDetailsScrean({required this.storeName, Key? key}) : super(key: key);
  final String storeName;
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double rate = 1;

  _buildHeaderText(text) {
    return PrimaryText(
      text: text,
      fontWeight: FontWeight.bold,
    );
  }

  _builddescText(text) {
    return PrimaryText(
      text: text,
    );
  }

  List<Map> convertSocial(store) {
    final list = convertMapToList(store.social!.toJson());
    List<Map> convertedList = [];
    for (var map in list) {
      switch (map.keys.first) {
        case "insta":
          convertedList.add({
            'name': 'انستجرام',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.instagram,
            'color': socialColor['instagram']
          });
          break;
        case "twitter":
          convertedList.add({
            'name': 'تويتر',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.twitter,
            'color': socialColor['twitter'],
          });
          break;
        case "fb":
          convertedList.add({
            'name': 'فبس بوك',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.facebook,
            'color': socialColor['facebook']
          });
          break;
        case "yt":
          convertedList.add({
            'name': 'يوتيوب',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.youtube,
            'color': socialColor['youtube']
          });
          break;
        case "snap":
          convertedList.add({
            'name': 'سناب شات',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.snapchat,
            'color': socialColor['snapchat']
          });
          break;
        case "tiktok":
          convertedList.add({
            'name': 'تيك توك',
            'link': map[map.keys.first],
            'icon': FontAwesomeIcons.tiktok,
            'color': kblack
          });
          break;
      }
    }
    return convertedList;
  }

  Widget buildFirstIndex(Store store) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeaderText("متجر " ' :'),
          _builddescText(store.desc),
          SizedBox(height: defultPadding),
          if (convertSocial(store).isNotEmpty)
            _buildHeaderText('وسائل التواصل : '),
          ...convertSocial(store)
              .map<Widget>((e) => TextButton.icon(
                  onPressed: () async =>
                      await launch(Uri.parse(e['link']).toString()),
                  icon: Icon(
                    e['icon'],
                    color: e['color'],
                  ),
                  label: _builddescText('\t\t' + e['name'])))
              .toList(),
          SizedBox(height: defultPadding),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<StoreProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: kblack),
          title: PrimaryText(
            text: storeName,
            fontWeight: FontWeight.w600,
            fontSizeRatio: 1,
          ),
          backgroundColor: kwhite,
          elevation: 2,
        ),
        body: PrimaryFutureWidget<Store>(
            future: pro.getStore(storeName),
            data: (Store store) {
              return ListView(
                  padding: EdgeInsets.all(defultPadding),
                  children: [
                    buildFirstIndex(store),
                    Row(
                      children: [
                        Expanded(
                          child: _buildHeaderText('المنتجات :'),
                        ),
                        if ((store.products ?? []).length > 10)
                          PrimaryText(
                            text: 'مشاهدة المزيد',
                            color: kprimary,
                            fontSizeRatio: 0.8,
                            onTap: () => Nav.goToScrean(ProductsScrean(
                              products: (store.products ?? []),
                              type: 'AllProducts',
                            )),
                          )
                      ],
                    ),
                    SizedBox(height: defultPadding),
                    CarouselSlider.builder(
                        options: CarouselOptions(
                            height: kheight * 0.45,
                            autoPlay: store.products!.length > 1,
                            scrollPhysics: BouncingScrollPhysics()),
                        itemCount: (store.products ?? [])
                            .getRange(
                                0,
                                store.products!.length > 10
                                    ? 10
                                    : store.products!.length)
                            .length,
                        itemBuilder: (BuildContext context, int idx,
                                int pageViewIndex) =>
                            SizedBox(
                              width: kweidth / 1.5,
                              child: ProductCard(
                                  product: store.products![idx],
                                  uniqueId: 'storeDetails$idx'),
                            )),
                    SizedBox(height: defultPadding * 2),
                    Form(
                      key: _formKey,
                      child: PrimaryInputField(
                        autoValidate: AutovalidateMode.disabled,
                        hintText: 'اكتب تعليقك ...',
                        controller: _commentController,
                        headerText: 'تعليقك',
                        hasTextHeader: false,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: defultPadding),
                    StatefulBuilder(
                      builder: (_, setState) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAuth) {
                                  return Alert.showAuthAlert();
                                }
                                if (_formKey.currentState!.validate()) {
                                  final res = await pro.rateStore(store.id!,
                                      rate, _commentController.text.trim());
                                  if (res.isNotEmpty) {
                                    Alert.showSuccessDialog(
                                        title: 'تقييم المتجر',
                                        desc: 'تم التقييم بنجاح',
                                        ontap: () {
                                          Nav.pop();
                                          _commentController.clear();
                                          rate = 1;
                                          setState(() {});
                                        });
                                  }
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
                                    onRatingUpdate: (double rating) {})),
                          ]),
                    ),
                    SizedBox(height: defultPadding * 2),
                  ]);
            }));
  }
}
