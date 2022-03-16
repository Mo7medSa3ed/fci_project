import 'package:fci_project/data/models/product.dart';

class Home {
  List<Product> mostViewedProducts;
  List<Product> mostOrderedProducts;
  List<Product> mostRatedProducts;

  Home(
      {required this.mostOrderedProducts,
      required this.mostRatedProducts,
      required this.mostViewedProducts});

  factory Home.fromJson(json) => Home(
      mostOrderedProducts: (json['mostOrderedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      mostRatedProducts: (json['mostRatedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      mostViewedProducts: (json['mostViewedProducts'] ?? [])
          .map<Product>((e) => Product.fromJson(e))
          .toList());
}
