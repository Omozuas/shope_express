import 'dart:convert';

class CategoryResopnsModel {
  CategoryResopnsModel({required this.message, required this.success});

  late final success;
  late final stack;
  late final String message;

  CategoryResopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    stack = json['stack'];
  }
}

CategoryResopnsModel categoryResopnsModel(String str) =>
    CategoryResopnsModel.fromJson(json.decode(str));
