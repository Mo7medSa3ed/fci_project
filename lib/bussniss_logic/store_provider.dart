import 'package:fci_project/data/models/store.dart';
import 'package:fci_project/data/repositories/store_repository.dart';
import 'package:flutter/foundation.dart';

class StoreProvider extends ChangeNotifier {
  final _storeRepository = StoreRepository();

  Future<Store> getStore(String storeName) async {
    final response = await _storeRepository.getStore(storeName);
    return Store.fromJson(response);
  }
}
