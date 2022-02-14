import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/data/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  List<Product> favProducts = [];
  final _userRepository = UserRepository();

  initFavProducts(favProducts) {
    this.favProducts.clear();
    this.favProducts.addAll(favProducts);
    notifyListeners();
  }

  changeSelectedForFavProduct(selectFavProductId) {
    final idx = favProducts.indexWhere((e) => e.id == selectFavProductId);
    if (idx != -1) {
      favProducts[idx].selected = !favProducts[idx].selected;
      notifyListeners();
    }
  }

  List<Product> getSelectedFavProducts() {
    return favProducts.where((e) => e.selected).toList();
  }

  Future addProductToFav(id) async {
    final json = await _userRepository.addProductToFav(id);
    return Product.fromJson(json);
  }

  Future<List<Product>> getAllFavouriteProducts() async {
    final json = await _userRepository.getAllFavouriteProducts();
    return json.map<Product>((e) => Product.fromJson(e)).toList();
  }
}
