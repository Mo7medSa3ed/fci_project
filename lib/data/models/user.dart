class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? country;
  String? address;
  String? role;
  String? dop;
  String? password;
  List? fav;
  List? orders;
  String? storeName;
  String? createdAt;
  String? updatedAt;

  User({
    this.country,
    this.createdAt,
    this.email,
    this.id,
    this.name,
    this.phone,
    this.role,
    this.updatedAt,
    this.address,
    this.dop,
    this.fav,
    this.orders,
    this.password,
    this.storeName,
  });

  factory User.fromJson(Map json) => User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        country: json['country'],
        role: json['role'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        address: json['address'],
        dop: json['dop'],
        fav: json['fav'],
        orders: json['orders'],
        password: json['password'],
        storeName: json['storeName'],
      );

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> json = {};
  //   json['_id'] = id;
  //   json['name'] = name;
  //   json['email'] = email;
  //   json['phone'] = phone;
  //   json['country'] = country;
  //   json['role'] = role;
  //   json['createdAt'] = createdAt;
  //   json['updatedAt'] = updatedAt;
  //   return json;
  // }
}
