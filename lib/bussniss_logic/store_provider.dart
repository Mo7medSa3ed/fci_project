import 'package:fci_project/data/models/store.dart';
import 'package:fci_project/data/repositories/store_repository.dart';
import 'package:flutter/foundation.dart';

class StoreProvider extends ChangeNotifier {
  final _storeRepository = StoreRepository();

  Future<Store> getStore() async {
    final response = await _storeRepository.getStore();
    return Store.fromJson(response);
  }
}
