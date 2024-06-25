import 'dart:convert';

class SubCategoryResopnsModel {
  SubCategoryResopnsModel({required this.message, required this.success});

  late final success;
  late final stack;
  late final String message;

  SubCategoryResopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    stack = json['stack'];
  }
}

SubCategoryResopnsModel subCategoryResopnsModel(String str) =>
    SubCategoryResopnsModel.fromJson(json.decode(str));
