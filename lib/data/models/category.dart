class Category {
  String? name;
  String? id;
  String? storeName;
  String? createdAt;
  String? updatedAt;
  bool selected = false;
  Category(
      {this.name, this.id, this.createdAt, this.updatedAt, this.storeName});
  factory Category.fromJson(Map json) => Category(
        id: json['_id'],
        name: json['name'],
        storeName: json['storeName'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['_id'] = id;
    json['storeName'] = storeName;
    return json;
  }
}
