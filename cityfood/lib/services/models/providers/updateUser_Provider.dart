import 'dart:convert';

class UpdateUsermodel {
  late final firstname;
  late final email;
  late final mobile;
  late final success;
  late final message;
  late final lastname;

  UpdateUsermodel({
    required this.firstname,
    required this.email,
    required this.mobile,
    required this.success,
    required this.lastname,
    required this.message,
  });
  UpdateUsermodel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    firstname = json['firstname'];
    email = json['email'];
    mobile = json['mobile'];
    lastname = json['lastname'];
  }
}

UpdateUsermodel updateUsermodel(String str) =>
    UpdateUsermodel.fromJson(json.decode(str));
