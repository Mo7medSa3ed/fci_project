import 'package:fci_project/bussniss_logic/user_provider.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:fci_project/main.dart';
import 'package:provider/provider.dart';

class Status {
  static String deliveryInProgress = "جاري التوصيل";
  static String underway = "قيد التنفيذ";
  static String done = "تم التنفيذ";
  static String awaitingReview = "بانتظار المراجعة";
  static String delivered = "تم التوصيل";
  static String charged = "تم الشحن";
  static String canceled = "ملغي";
  static String retrieved = "مسترجع";
  static String beingRetrieved = "قيد الاسترجاع";
}

class Order {
  String? id;
  List? items;
  Map<String, dynamic>? user;
  String? state;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.items,
      this.state,
      this.user,
      this.createdAt,
      this.updatedAt});

  factory Order.fromJson(Map json) => Order(
        id: json['_id'],
        items: json['items'],
        state: json['state'],
        user: json['user'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  static Map<String, dynamic> prepareOrder() {
    final userProvider =
        Provider.of<UserProvider>(navKey.currentContext!, listen: false);

    final data = {
      "state": Status.awaitingReview,
      "items": userProvider.cart.values
          .map<Map<String, dynamic>>((e) => {
                'name': e.name,
                'amount': e.cartAmount,
                'price': e.price,
                'img': e.images!.first,
              })
          .toList(),
      "user": {
        "name": currantUser.name,
        "tel": currantUser.phone,
        "address": 'منيا القمح الشرقية',
        "payment": 'كاش',
      },
      'storeName': storeName
    };
    return data;
  }
}
