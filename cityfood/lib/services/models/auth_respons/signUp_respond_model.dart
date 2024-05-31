import 'dart:convert';

class SigupResopnsModel {
  SigupResopnsModel({required this.message, required this.success});

  late final success;
  late final stack;
  late final String message;

  SigupResopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    stack = json['stack'];
  }
}

SigupResopnsModel sigupResopnsModel(String str) =>
    SigupResopnsModel.fromJson(json.decode(str));
