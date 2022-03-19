import 'package:fci_project/helper/constants.dart';

class Category {
  String? name;
  String? id;
  String? img;
  String? createdAt;
  String? updatedAt;
  bool selected = false;
  Category({this.name, this.id, this.createdAt, this.updatedAt, this.img});
  factory Category.fromJson(Map json) => Category(
        id: json['_id'],
        name: json['name'],
        img: json['img'] ?? randomImagesUrl,
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['_id'] = id;
    json['img'] = img;
    return json;
  }
}
