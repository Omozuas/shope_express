import 'dart:convert';

class LoginresopnsModel {
  LoginresopnsModel(
      {required this.message, required this.token, required this.success});

  late final success;
  late final token;
  late final String message;
  late final String role;

  LoginresopnsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    message = json['message'];
    role = json['role'];
  }
}

LoginresopnsModel loginresopnsModel(String str) =>
    LoginresopnsModel.fromJson(json.decode(str));
