import 'dart:convert';

class LogoutResopnsModel {
  LogoutResopnsModel({required this.message, required this.success});

  late final success;
  late final stack;
  late final String message;

  LogoutResopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    stack = json['stack'];
  }
}

LogoutResopnsModel logoutResopnsModel(String str) =>
    LogoutResopnsModel.fromJson(json.decode(str));
