import 'package:fci_project/data/models/category.dart' as cat;
import 'package:fci_project/data/models/product.dart';
import 'package:fci_project/data/repositories/product_repository.dart';
import 'package:fci_project/main.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final _productRepository = ProductRepository();
  int currantIndex = 0;
  List<String> saveCategoryListFilter = [];
  List<cat.Category> categories = [];

  clear() {
    saveCategoryListFilter.clear();
    categories.clear();
  }

  changeSelectedCategory(String categoryId) {
    final idx = categories.indexWhere((e) => e.id == categoryId);
    if (idx != -1) {
      categories[idx].selected = !categories[idx].selected;
      notifyListeners();
    }
  }

  initCategories(List<cat.Category> categories) {
    this.categories.clear();
    this.categories = categories;
    notifyListeners();
  }

  addToCategoryListFilter(String categoryId) {
    if (saveCategoryListFilter.contains(categoryId)) {
      saveCategoryListFilter.remove(categoryId);
    } else {
      saveCategoryListFilter.add(categoryId);
    }
  }

  changeIndex(int index) {
    currantIndex = index;
    notifyListeners();
  }

  Future<List<cat.Category>> getAllCategories() async {
    final json = await _productRepository.getOneOrAllCategories();
    return json.map<cat.Category>((e) => cat.Category.fromJson(e)).toList();
  }

  Future<cat.Category> getOneCategories(id) async {
    final json = await _productRepository.getOneOrAllCategories(id: id);
    return cat.Category.fromJson(json);
  }

  Future<List<Product>> getAllProducts() async {
    final json = await _productRepository.getOneOrAllProducts();
    return json.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getOneProduct(id) async {
    final json = await _productRepository.getOneOrAllProducts(id: id);
    return Product.fromJson(json);
  }

  Future<Map<String, dynamic>> rateProduct(
      String productId, double rate, String comment) async {
    Map<String, dynamic> data = {
      'userId': currantUser.id,
      'rate': rate,
      'comment': comment
    };
    final json = await _productRepository.rateProduct(productId, data);
    return json;
  }

  Future<List<Product>> searchProduct(String term) async {
    final json = await _productRepository.searchProduct(term);
    return json['products'].map<Product>((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> searchProductByCategory(String term) async {
    final json = await _productRepository.searchProductByCategory(term);
    return json['products'].map<Product>((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getProductsByTerm(String term) async {
    final json = await _productRepository.getProductsByTerm(term);
    return json.map<Product>((e) => Product.fromJson(e)).toList();
  }
}
