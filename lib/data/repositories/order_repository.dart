import 'package:fci_project/data/api_service/api.dart';

class OrderRepository {
  static ApiServices? _apiServices;

  OrderRepository() {
    _apiServices ??= ApiServices.getInstance()!;
  }

  Future makeOrder(Map<String, dynamic> data) async {
    final res =
        await _apiServices!.post(url: '/orders', data: data, showAlert: true);
    return res;
  }

  Future getAllOrders() async {
    final res =
        await _apiServices!.get(url: '/users/all/orders', showAlert: false);

    return res;
  }
}
