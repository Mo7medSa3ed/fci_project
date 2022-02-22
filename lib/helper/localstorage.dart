import 'dart:convert';

import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:fci_project/helper/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;
  static Future<LocalStorage?> getInstance() async {
    _prefs ??= (await SharedPreferences.getInstance());
  }

 

  static setString(key, value) async {
    await getInstance();
    await _prefs!.setString(key, value);
  }

  static Future<String> getString(key) async {
    await getInstance();
    final val = _prefs!.getString(key);
    return val ?? "";
  }

  static Future<bool> addProductToCart(Product product) async {
    await getInstance();
    List<String> products = _prefs!.getStringList(cart) ?? [];
    products.add(jsonEncode(product.toJson()));
    await _prefs!.setStringList(cart, products);
    Alert.showSnackBar("تم الإضافة بنجاح");
    return true;
  }

  static Future<bool> removeProductFromCart(Product product) async {
    await getInstance();
    List<String> products = _prefs!.getStringList(cart) ?? [];
    products.removeWhere((prod) {
      final parsed = jsonDecode(prod);
      return parsed['_id'] == product.id;
    });
    await _prefs!.setStringList(cart, products);
    return true;
  }

  static Future<List<Product>> getAllProductInCart() async {
    await getInstance();
    List<String> products = _prefs!.getStringList(cart) ?? [];
    return products
        .map<Product>((e) => Product.fromJsonForCart(jsonDecode(e)))
        .toList();
  }
}
