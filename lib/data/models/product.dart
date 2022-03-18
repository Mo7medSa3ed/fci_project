import 'package:fci_project/data/models/category.dart';

class Product {
  String? id;
  String? name;
  String? desc;
  Category? category;
  Amount amount;
  String? storeName;
  List? images;
  num? price;
  String? url;
  num? views;
  num? ordered;
  bool? visible;
  List? rating;
  num? rate;
  String? createdAt;
  String? updatedAt;
  bool selected = false;
  int cartAmount = 1;

  Product({
    this.createdAt,
    this.id,
    this.name,
    this.category,
    required this.amount,
    this.desc,
    this.images,
    this.ordered,
    this.price,
    this.rating,
    this.storeName,
    this.updatedAt,
    this.url,
    this.rate,
    this.views,
    this.visible,
    this.cartAmount = 1,
  });

  factory Product.fromJson(Map json) => Product(
        id: json['_id'],
        name: json['name'],
        amount: Amount.fromJson(json['amount'] ?? {}),
        cartAmount: 1,
        category: Category.fromJson(json['category'].runtimeType == String
            ? Category(name: '', id: json['category']).toJson()
            : json['category']),
        desc: json['desc'],
        images: json['images'],
        ordered: json['ordered'],
        price: json['price'],
        rating: json['rating'],
        storeName: json['storeName'],
        url: json['url'],
        views: json['views'],
        rate: json['actualRating'] ?? 0,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
  factory Product.fromJsonForCart(Map json) => Product(
        id: json['_id'],
        name: json['name'],
        amount: Amount.fromJson(json['amount'] ?? {}),
        category: json['category'],
        desc: json['desc'],
        images: json['images'],
        price: json['price'],
        rating: json['rating'],
        rate: json['rate'],
        storeName: json['storeName'],
        url: json['url'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['_id'] = id;
    json['name'] = name;
    json['amount'] = amount.toJson();
    json['category'] = category;
    json['desc'] = desc;
    json['images'] = images;
    json['price'] = price;
    json['rating'] = rating;
    json['rate'] = rate ?? 0;
    json['storeName'] = storeName;
    json['url'] = url;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}

class Amount {
  num alarmAmount;
  num available;
  bool alarm;
  String amountType;
  Amount(
      {this.alarm = false,
      this.alarmAmount = 0,
      this.available = 0,
      this.amountType = 'unlimited'});
  factory Amount.fromJson(Map json) => Amount(
      alarm: json['alarm'] ?? false,
      alarmAmount: json['alarmAmount'] ?? 0,
      amountType: json['amountType'] ?? 'unlimited',
      available: json['available'] ?? 0);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['alarm'] = alarm;
    json['alarmAmount'] = alarmAmount;
    json['amountType'] = amountType;
    json['available'] = available;
    return json;
  }
}
