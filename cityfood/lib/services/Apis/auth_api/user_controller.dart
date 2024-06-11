import 'dart:convert';
import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/auth_respons/loginRespons-model.dart';
import 'package:cityfood/services/models/auth_respons/logoutRespons.dart';
import 'package:cityfood/services/models/auth_respons/signUp_respond_model.dart';
import 'package:cityfood/services/models/providers/updateUser_Provider.dart';
import 'package:cityfood/services/models/providers/user_Provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<SigupResopnsModel> createUser(
    String firstname,
    String lastname,
    String email,
    String mobile,
    String password,
  ) async {
    setLoading(true);

    var registerUser = "${ApiUrl.baseUrl}signup";
    var res = await http.post(Uri.parse(registerUser),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "mobile": mobile,
          "password": password
        }));

    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return sigupResopnsModel(res.body);
  }

  Future<LoginresopnsModel> loginaUser(String email, String password) async {
    setLoading(true);

    var loginUser = "${ApiUrl.baseUrl}logIn";
    print(loginUser);
    var res = await http.post(Uri.parse(loginUser),
        headers: {'Content-Type': "application/json; charset=utf-8"},
        body: jsonEncode({"email": email, "password": password}));

    if (res.statusCode == 200) {
      var jsonres = jsonDecode(res.body);
      final _preferences = await SharedPreferences.getInstance();
      _preferences.setString('token', jsonres['token']);
      _preferences.setString('role', jsonres['role']);

      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return loginresopnsModel(res.body);
  }

  Future<Clientmodel> getUser(String token) async {
    setLoading(true);
    var getuser = "${ApiUrl.baseUrl}:id";
    var res = await http.get(
      Uri.parse(getuser),
      headers: {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "Bearer $token"
      },
    );

    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return clientmodel(res.body);
  }

  Future<LogoutResopnsModel> logOutUser(String token) async {
    setLoading(true);

    var logoutUser = "${ApiUrl.baseUrl}logout";
    print(logoutUser);
    var res = await http.get(
      Uri.parse(logoutUser),
      headers: {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "Bearer $token"
      },
    );

    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return logoutResopnsModel(res.body);
  }

  Future<UpdateUsermodel> updateUser(String firstname, String lastname,
      String email, String mobile, String token) async {
    setLoading(true);

    var loginUser = "${ApiUrl.baseUrl}edit-user";
    print(loginUser);
    var res = await http.put(Uri.parse(loginUser),
        headers: {
          'Content-Type': "application/json; charset=utf-8",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "mobile": mobile,
        }));

    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return updateUsermodel(res.body);
  }
}
