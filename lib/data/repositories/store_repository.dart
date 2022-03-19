import 'package:fci_project/data/api_service/api.dart';

class StoreRepository {
  static ApiServices? _apiServices;

  StoreRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future getStore(String storeName) async {
    final res =
        await _apiServices!.get(url: '/stores/one/$storeName', showAlert: false);
    return res;
  }
}
