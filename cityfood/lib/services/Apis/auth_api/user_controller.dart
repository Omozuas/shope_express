import 'dart:convert';
import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/auth_respons/loginRespons-model.dart';
import 'package:cityfood/services/models/auth_respons/signUp_respond_model.dart';
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

  Future<SigupResopnsModel> createUser(String firstname, String lastname,
      String email, String password, String mobile) async {
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
    var res = await http.post(Uri.parse(loginUser),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({"email": email, "password": password}));

    if (res.statusCode == 200) {
      var jsonres = jsonDecode(res.body);
      final _preferences = await SharedPreferences.getInstance();
      _preferences.setString('token', jsonres['token']);
      print(_preferences.getString('token'));
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return loginresopnsModel(res.body);
  }
}
