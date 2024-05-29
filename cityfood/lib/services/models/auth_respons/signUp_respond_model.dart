import 'dart:convert';

class SigupResopnsModel {
  SigupResopnsModel({required this.message, required this.success});

  late final success;

  late final String message;

  SigupResopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}

SigupResopnsModel sigupResopnsModel(String str) =>
    SigupResopnsModel.fromJson(json.decode(str));
