import 'dart:convert';

import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/data/models/user.dart';
import 'package:fci_project/data/repositories/user_repository.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/helper/localstorage.dart';
import 'package:fci_project/helper/navigator.dart';
import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/screans/home_screan/home_screan.dart';
import 'package:fci_project/presentation/screans/login_screan/login_screan.dart';
import 'package:fci_project/presentation/screans/onboard_screan/onboard_screan.dart';
import 'package:fci_project/presentation/screans/splash_screan/widgets/splash_logo.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScrean extends StatelessWidget {
  const SplashScrean({Key? key}) : super(key: key);

  initAndRoutePage() async {
    await LocalStorage.setString(token,
        'client,eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxZmMzMDljMzE2Mjc0NzgzMTA0YWU1ZiIsInJvbGUiOiJjbGllbnQiLCJpYXQiOjE2NDU1NTcxOTYsImV4cCI6MTY0NTU5MzE5Nn0.C4gIg2I7NDAFtV8PhwYPhOjINhUIyvCi2CbSPvU-qpM');
    tok = (await LocalStorage.getString(token));
    final res = (await LocalStorage.getString(user));
    if (res.isNotEmpty) {
      currantUser = User.fromJson(jsonDecode(res));
    }
    if (tok.isNotEmpty) {
      isAuth = true;
    } else {
      isAuth = false;
    }
    if ((await LocalStorage.getString(isFirst)).isEmpty) {
      return Nav.goToScreanAndRemoveUntill(OnboardScrean());
    }
    if (!isAuth) {
      return Nav.goToScreanAndRemoveUntill(LoginScrean());
    }
    final pro =
        Provider.of<UserProvider>(navKey.currentContext!, listen: false);
    try {
      final json = await UserRepository().getAllFavouriteProducts();
      List<String> favProductsIds =
          json.map<String>((e) => e['_id'].toString()).toList();
      pro.initFavProductsIds(favProductsIds);
    } catch (e) {
      return Nav.goToScreanAndRemoveUntill(HomeScrean());
    }

    return Nav.goToScreanAndRemoveUntill(HomeScrean());
  }

  @override
  Widget build(BuildContext context) {
    setStatusColor(color: kprimary, isDark: false);
    initAndRoutePage();
    return Scaffold(
      backgroundColor: kprimary,
      body: Center(child: SplashLogo()),
    );
  }
}
