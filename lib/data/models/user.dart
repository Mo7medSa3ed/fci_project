class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? country;
  dynamic address;
  String? role;
  String? dop;
  String? password;
  List? fav;
  List? orders;
  List? interests;
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
    this.interests,
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
        interests: json['intersts'] ?? [],
        storeName: json['storeName'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null && id!.isNotEmpty) json['_id'] = id;
    if (name != null && name!.isNotEmpty) json['name'] = name;
    if (email != null && email!.isNotEmpty) json['email'] = email;
    if (phone != null && phone!.isNotEmpty) {
      if (phone!.startsWith('0')) {
        json['phone'] = phone;
      } else {
        json['phone'] = '0' + phone!;
      }
    }
    if (country != null && country!.isNotEmpty) json['country'] = country;
    if (address != null && address!.isNotEmpty) json['address'] = address;
    if (password != null && password!.isNotEmpty) json['password'] = password;
    return json;
  }

  static Map<String, dynamic> toJsonForSaveInterests(List<String> interstsIds) {
    Map<String, dynamic> json = {};
    json['intersts'] = interstsIds;
    return json;
  }
}
