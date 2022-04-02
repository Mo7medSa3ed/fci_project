import 'package:fci_project/data/models/category.dart';
import 'package:fci_project/data/models/product.dart';

class Store {
  String? id;
  String? desc;
  List<Category>? workOn;
  String? createdAt;
  Contacts? contacts;
  OtherLinks? otherLinks;
  Social? social;
  List<Product>? products;

  Store(
      {this.id,
      this.contacts,
      this.createdAt,
      this.desc,
      this.otherLinks,
      this.products,
      this.social,
      this.workOn});

  factory Store.fromJson(Map json, List storeProducts) => Store(
        id: json['_id'],
        contacts: Contacts.fromJson(json['contacts']),
        createdAt: json['createdAt'],
        desc: json['desc'],
        otherLinks: OtherLinks.fromJson(json['otherLinks']),
        social: Social.fromJson(json['social']),
        workOn: (json['workOn'] ?? [])
            .map<Category>((e) => Category.fromJson(e))
            .toList(),
        products:
            storeProducts.map<Product>((e) => Product.fromJson(e)).toList(),
      );
}

class Contacts {
  String? tel;
  String? whats;
  String? phone;
  String? telegram;
  String? email;
  String? id;
  Contacts({
    this.email,
    this.id,
    this.tel,
    this.phone,
    this.telegram,
    this.whats,
  });

  factory Contacts.fromJson(Map json) => Contacts(
        tel: json['tel'],
        whats: json['whats'],
        phone: json['phone'],
        telegram: json['telegram'],
        email: json['email'],
        id: json['_id'],
      );
}

class OtherLinks {
  String? link;
  String? android;
  String? apple;
  String? id;
  OtherLinks({this.android, this.apple, this.id, this.link});

  factory OtherLinks.fromJson(Map json) => OtherLinks(
        link: json['link'],
        android: json['android'],
        apple: json['apple'],
        id: json['_id'],
      );
}

class Social {
  String? insta;
  String? twitter;
  String? fb;
  String? yt;
  String? snap;
  String? tiktok;
  String? id;
  Social(
      {this.fb,
      this.id,
      this.insta,
      this.snap,
      this.tiktok,
      this.twitter,
      this.yt});

  factory Social.fromJson(Map json) => Social(
        insta: json['insta'],
        twitter: json['twitter'],
        fb: json['fb'],
        yt: json['yt'],
        snap: json['snap'],
        tiktok: json['tiktok'],
        id: json['_id'],
      );
  Map toJson() => {
        'insta': insta,
        'twitter': twitter,
        'fb': fb,
        'yt': yt,
        'snap': snap,
        'tiktok': tiktok,
      };
}
