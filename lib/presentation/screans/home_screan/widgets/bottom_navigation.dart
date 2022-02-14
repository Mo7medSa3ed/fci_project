import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _homeProvider.currantIndex,
        onTap: _homeProvider.changeIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'الرئيسئة'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'استكشف'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp), label: 'السلة'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابى'),
        ]);
  }
}
