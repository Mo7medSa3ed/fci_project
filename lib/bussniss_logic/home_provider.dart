
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int currantIndex = 0;
  
  changeIndex(int index) {
    currantIndex = index;
    notifyListeners();
  }


}
