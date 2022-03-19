import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/data/models/product.dart';

class Home {
  List<Product> mostViewedProducts;
  List<Product> mostOrderedProducts;
  List<Product> mostRatedProducts;
  List<Category> categories;

  Home({
    required this.mostOrderedProducts,
    required this.mostRatedProducts,
    required this.mostViewedProducts,
    required this.categories,
  });

  factory Home.fromJson(json) => Home(
      mostOrderedProducts: (json['mostOrderedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      mostRatedProducts: (json['mostRatedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      mostViewedProducts: (json['mostViewedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      categories: (json['categories'] ?? [])
          .map<Category>((e) => Category.fromJson(e))
          .toList());
}
