import 'package:fci_project/data/models/order.dart';
import 'package:fci_project/data/repositories/order_repository.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier {
  final _orderRepository = OrderRepository();
  Future makeOrder() async {
    await _orderRepository.makeOrder(Order.prepareOrder());
  }

  Future<List<Order>> getAllOrders() async {
    final json = await _orderRepository.getAllOrders();
    return json.map<Order>((e) => Order.fromJson(e)).toList();
  }
}
