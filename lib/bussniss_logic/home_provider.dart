import 'package:fci_project/data/models/home.dart';
import 'package:fci_project/data/repositories/home_repository.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/main.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int currantIndex = 0;

  final _homeRepository = HomeRepository();

  changeIndex(int index) {
    currantIndex = index;
    if (!isAuth && index > 2) {
      return Alert.showAuthAlert();
    }
    notifyListeners();
  }

  Future<Home> getHomePage() async {
    final res = await _homeRepository.getHome();
    return Home.fromJson(res);
  }
}
