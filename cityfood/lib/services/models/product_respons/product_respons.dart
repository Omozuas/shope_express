import 'dart:convert';

class ProductresopnsModel {
  ProductresopnsModel({
    required this.message,
    required this.success,
  });

  late final success;
  late final String message;

  ProductresopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}

ProductresopnsModel productresopnsModel(String str) =>
    ProductresopnsModel.fromJson(json.decode(str));
