import 'dart:convert';

class UpdateUsermodel {
  late final firstname;
  late final email;
  late final mobile;
  late final success;
  late final message;
  late final lastname;
  late final user;
  late final profileImg;

  UpdateUsermodel(
      {required this.firstname,
      required this.email,
      required this.mobile,
      required this.success,
      required this.lastname,
      required this.message,
      required this.profileImg,
      required this.user});
  UpdateUsermodel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'];
    profileImg = json['profileImg'];
    firstname = user['firstname'];
    email = user['email'];
    mobile = user['mobile'];
    lastname = user['lastname'];
  }
}

UpdateUsermodel updateUsermodel(String str) =>
    UpdateUsermodel.fromJson(json.decode(str));
