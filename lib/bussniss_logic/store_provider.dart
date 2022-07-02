import 'package:fci_project/data/models/store.dart';
import 'package:fci_project/data/repositories/store_repository.dart';
import 'package:fci_project/main.dart';
import 'package:flutter/foundation.dart';

class StoreProvider extends ChangeNotifier {
  final _storeRepository = StoreRepository();

  Future<Store> getStore(String storeName) async {
    final response = await _storeRepository.getStore(storeName);

    return Store.fromJson(response['store'], response['products']);
  }

  Future<Map<String, dynamic>> rateStore(
      String storeId, double rate, String comment) async {
    Map<String, dynamic> data = {
      'userId': currantUser.id,
      'rate': rate,
      'comment': comment
    };
    final json = await _storeRepository.rateStore(storeId, data);
    return json;
  }
}
