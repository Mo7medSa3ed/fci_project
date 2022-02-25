import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/main.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int currantIndex = 0;

  changeIndex(int index) {
    currantIndex = index;
    if (!isAuth && index > 2) {
      return Alert.showAuthAlert();
    }
    notifyListeners();
  }
}
