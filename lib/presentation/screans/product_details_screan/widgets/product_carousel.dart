import 'dart:math';

import 'package:fci_project/bussniss_logic/home_provider.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_icon_button.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCarousel extends StatelessWidget {
  ProductCarousel(this.imageList, this.id,{Key? key}) : super(key: key);
  final List<dynamic> imageList;
  final String id;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defultPadding),
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.06),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      height: kheight * 0.4,
      child: Hero(
        tag: ObjectKey(id),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 30,
                  top: 0,
                  right: 30,
                  bottom: 50,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageList.length,
                    physics: BouncingScrollPhysics(),
                    onPageChanged:
                        Provider.of<HomeProvider>(context, listen: false)
                            .changeIndex,
                    itemBuilder: (ctx, i) => Container(
                      margin: EdgeInsets.symmetric(horizontal: kpadding),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageList[i],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Selector<HomeProvider, int>(
                    selector: (_, homeProvider) => homeProvider.currantIndex,
                    builder: (_, currantIndex, c) => Row(
                      children: List.generate(
                        imageList.length,
                        (index) => Container(
                          height: 7,
                          width: currantIndex == index ? 20 : 7,
                          margin: EdgeInsets.all(defultPadding / 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: currantIndex == index
                                  ? kprimary
                                  : kgrey.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: -15,
                    top: 0,
                    bottom: 50,
                    child: Selector<HomeProvider, int>(
                      selector: (_, homeProvider) => homeProvider.currantIndex,
                      builder: (_, currantIndex, c) => PrimaryIconButton(
                        Icons.arrow_forward_ios,
                        onTap: currantIndex == 0
                            ? null
                            : () {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInOut);
                              },
                      ),
                    )),
                Positioned(
                  right: -8,
                  bottom: 50,
                  top: 0,
                  child: Selector<HomeProvider, int>(
                      selector: (_, homeProvider) => homeProvider.currantIndex,
                      builder: (_, currantIndex, c) => PrimaryIconButton(
                            Icons.arrow_back_ios,
                            onTap: currantIndex == imageList.length - 1
                                ? null
                                : () {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOut);
                                  },
                          )),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
