import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/data/repositories/user_repository.dart';
import 'package:fci_project/helper/alert_dialog.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  final _userRepository = UserRepository();
  List<Product> favProducts = [];
  Map<String, Product> cart = {};
  List<String> favProductsIds = [];

  clearCart() {
    cart.clear();
    notifyListeners();
  }

  double calcTotalCart() {
    double total = 0;
    for (var product in cart.values) {
      total += product.cartAmount * product.price!;
    }
    return total;
  }

  addToCart(Product product) {
    cart.addAll({product.id!: product});
    Alert.showSnackBar("تم الإضافة بنجاح");
    notifyListeners();
  }

  removeFromCart(String id) {
    if (cart.containsKey(id)) {
      cart.remove(id);
      Alert.showSnackBar("تم الحذف بنجاح");
      notifyListeners();
    }
  }

  addAmount(id) {
    cart.update(id, (value) {
      value.cartAmount += 1;
      return value;
    });
    notifyListeners();
  }

  minusAmount(id) {
    cart.update(id, (value) {
      value.cartAmount -= 1;
      return value;
    });
    notifyListeners();
  }

  isExistInCart(id) {
    return cart.containsKey(id);
  }

  initFavProducts(favProducts) {
    this.favProducts.clear();
    this.favProducts.addAll(favProducts);
    notifyListeners();
  }

  initFavProductsIds(List<String> favProductsIds) {
    this.favProductsIds.clear();
    this.favProductsIds.addAll(favProductsIds);
  }

  removeFavProduct(id) {
    favProducts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  addAndRemoveFavId(id) {
    if (favProductsIds.contains(id)) {
      favProductsIds.remove(id);
    } else {
      favProductsIds.add(id);
    }
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

  Future addAndRemoveProductToFav(id) async {
    await _userRepository.addProductToFav(id);
    removeFavProduct(id);
  }

  Future addAndRemoveProductFavId(id) async {
    await _userRepository.addProductToFav(id);
    addAndRemoveFavId(id);
  }

  Future<List<Product>> getAllFavouriteProducts() async {
    final json = await _userRepository.getAllFavouriteProducts();
    return json.map<Product>((e) => Product.fromJson(e)).toList();
  }
  
  
  

}
