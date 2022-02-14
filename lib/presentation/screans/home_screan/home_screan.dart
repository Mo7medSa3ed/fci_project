import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/presentation/screans/browse_screan/browse_screan.dart';
import 'package:fci_project/presentation/screans/cart_screan/cart_screan.dart';
import 'package:fci_project/presentation/screans/favourite_screan/favourite_screan.dart';
import 'package:fci_project/presentation/screans/home_screan/widgets/bottom_navigation.dart';
import 'package:fci_project/presentation/screans/main_screan/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScrean extends StatelessWidget {
  HomeScrean({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> screanList = [
    {"screan": MainScrean(), 'title': ''},
    {"screan": BrowseScrean(), 'title': 'ابحث عن المنتجات'},
    {"screan": CartScrean(), 'title': 'عربة التسوق'},
    {"screan": FavouriteScrean(), 'title': 'المفضلة'},
    {"screan": MainScrean(), 'title': ''},
  ];

  @override
  Widget build(BuildContext context) {
    setStatusColor(color: kwhite);
    return Selector<HomeProvider, int>(
        selector: (_, _homeProvider) => _homeProvider.currantIndex,
        builder: (ctx, index, child) {
          return Scaffold(
              appBar: screanList[index]['title'].isEmpty
                  ? null
                  : AppBar(
                      centerTitle: true,
                      backgroundColor: kwhite,
                      elevation: 0,
                      title: PrimaryText(
                        text: screanList[index]['title'],
                        fontWeight: FontWeight.bold,
                      )),
              bottomNavigationBar: const BottomNavigation(),
              body: SafeArea(child: screanList[index]['screan']));
        });
  }
}
