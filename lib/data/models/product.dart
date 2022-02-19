class Product {
  String? id;
  String? name;
  String? desc;
  List? category;
  Amount? amount;
  String? storeName;
  List? images;
  num? price;
  String? url;
  num? views;
  num? ordered;
  bool? visible;
  List? rating;
  String? createdAt;
  String? updatedAt;
  bool selected = false;
  int cartAmount = 1;

  Product({
    this.createdAt,
    this.id,
    this.name,
    this.category,
    this.amount,
    this.desc,
    this.images,
    this.ordered,
    this.price,
    this.rating,
    this.storeName,
    this.updatedAt,
    this.url,
    this.views,
    this.visible,
    this.cartAmount = 1,
  });

  factory Product.fromJson(Map json) => Product(
        id: json['_id'],
        name: json['name'],
        amount: Amount.fromJson(json['amount']),
        cartAmount: 1,
        category: json['category'],
        desc: json['desc'],
        images: json['images'],
        ordered: json['ordered'],
        price: json['price'],
        rating: json['rating'],
        storeName: json['storeName'],
        url: json['url'],
        views: json['views'],
        visible: json['visible']['app'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
  factory Product.fromJsonForCart(Map json) => Product(
        id: json['_id'],
        name: json['name'],
        amount: Amount.fromJson(json['amount']),
        category: json['category'],
        desc: json['desc'],
        images: json['images'],
        price: json['price'],
        rating: json['rating'],
        storeName: json['storeName'],
        url: json['url'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['_id'] = id;
    json['name'] = name;
    json['amount'] = amount!.toJson();
    json['category'] = category;
    json['desc'] = desc;
    json['images'] = images;
    json['price'] = price;
    json['rating'] = rating;
    json['storeName'] = storeName;
    json['url'] = url;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}

class Amount {
  num? alarmAmount;
  num? available;
  bool? alarm;
  String? amountType;
  Amount({this.alarm, this.alarmAmount, this.available, this.amountType});
  factory Amount.fromJson(Map json) => Amount(
      alarm: json['alarm'],
      alarmAmount: json['alarmAmount'] ?? 0,
      amountType: json['amountType'],
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
