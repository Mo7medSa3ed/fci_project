import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/presentation/screans/browse_screan/browse_screan.dart';
import 'package:fci_project/presentation/screans/cart_screan/cart_screan.dart';
import 'package:fci_project/presentation/screans/favourite_screan/favourite_screan.dart';
import 'package:fci_project/presentation/screans/home_screan/widgets/bottom_navigation.dart';
import 'package:fci_project/presentation/screans/main_screan/main.dart';
import 'package:fci_project/presentation/screans/profile_screan/profile_screan.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScrean extends StatelessWidget {
  HomeScrean({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> screanList = [
    {"screan": const MainScrean(), 'title': 'الرئيسية'},
    {"screan": const BrowseScrean(), 'title': 'ابحث عن المنتجات'},
    {"screan": const CartScrean(), 'title': 'عربة التسوق'},
    {"screan": const FavouriteScrean(), 'title': 'المفضلة'},
    {"screan": const ProfileScrean(), 'title': 'حسابى'},
  ];

  @override
  Widget build(BuildContext context) {
    setStatusColor(color: kwhite);
    Provider.of<HomeProvider>(context, listen: false).currantIndex = 0;
    return Selector<HomeProvider, int>(
        selector: (_, _homeProvider) => _homeProvider.currantIndex,
        builder: (ctx, index, child) {
          return Scaffold(
              appBar: screanList[index]['title'].isEmpty
                  ? null
                  : customAppBar(screanList[index]['title']),
              bottomNavigationBar: const BottomNavigation(),
              body: SafeArea(child: screanList[index]['screan']));
        });
  }
}
