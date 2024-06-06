import 'dart:convert';

class Clientmodel {
  late final firstname;
  late final email;
  late final mobile;
  late final isBlocked;
  late final isLogin;
  late final lastname;
  late final role;
  late final id;
  late final cart;
  late final wishlist;
  late final address;
  late final refreshToken;

  Clientmodel(
      {required this.firstname,
      required this.email,
      required this.mobile,
      required this.isBlocked,
      required this.lastname,
      required this.wishlist,
      required this.role,
      required this.isLogin,
      required this.refreshToken,
      required this.id,
      required this.address,
      required this.cart});
  Clientmodel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'];
    wishlist = json['wishlist'];
    address = json['address'];
    isLogin = json['isLogin'];
    firstname = json['firstname'];
    email = json['email'];
    mobile = json['mobile'];
    refreshToken = json['refreshToken'];
    isBlocked = json['isBlocked'];
    lastname = json['lastname'];
    role = json['role'];
    id = json['_id'];
  }
}

Clientmodel clientmodel(String str) => Clientmodel.fromJson(json.decode(str));
