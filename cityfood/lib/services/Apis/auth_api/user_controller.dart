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
import 'package:jwt_decoder/jwt_decoder.dart';

class UserProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool __isLoggedin = false;
  bool get loading => _isLoading;
  bool get loggedin => __isLoggedin;

  setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  void setLoggedin(bool value) {
    __isLoggedin = value;
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
      setLoggedin(true);
      _preferences.setBool('isLoggedIn', true);
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
      setLoggedin(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
      setLoggedin(false);
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
      final _preferences = await SharedPreferences.getInstance();
      _preferences.remove('isLoggedIn');
      _preferences.remove('token');
      setLoggedin(false);
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
      setLoggedin(true);
    } else if (res.statusCode == 500) {
      setLoggedin(true);
      setLoading(false);
    }

    return logoutResopnsModel(res.body);
  }

  Future<UpdateUsermodel> updateUser(List<MapEntry<String, dynamic>> data,
      token, List<Map<String, dynamic>> images) async {
    setLoading(true);
    var loginUser = "${ApiUrl.baseUrl}edit-user";

    var res = http.MultipartRequest('PUT', Uri.parse(loginUser))
      ..headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });
    for (var entry in data) {
      res.fields[entry.key] = entry.value;
      print(entry.key);
      print(entry.value);
    }

    List<http.MultipartFile> files = images.map((file) {
      print(file["path"]);
      return http.MultipartFile.fromBytes(
        'image',
        file["bytes"],
        filename: file["path"],
      );
    }).toList();
    res.files.addAll(files);
    var res1 = await res.send();
    var response = await http.Response.fromStream(res1);
    var dd = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(dd);
      setLoading(false);
    } else if (response.statusCode == 404) {
      print(response.body);
      setLoading(false);
    } else if (response.statusCode == 500) {
      setLoading(false);
    }
    return UpdateUsermodel.fromJson(dd);
  }

  Future<void> checkLoginStatus() async {
    final _preferences = await SharedPreferences.getInstance();
    __isLoggedin = _preferences.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<bool> isTokenValid() async {
    final _preferences = await SharedPreferences.getInstance();
    if (_preferences.getString('token') == null)
      return false; // No token stored
    return !JwtDecoder.isExpired(_preferences.getString('token')!);
  }
}
