import 'dart:convert';
import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/auth_respons/signUp_respond_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) async {
    _isLoading = value;
    notifyListeners();
  }

  Future<SigupResopnsModel> createUser(String firstname, String lastname,
      String email, String password, String mobile) async {
    setLoading(true);

    var registerUser = "${ApiUrl.baseUrl}signup";

    print(registerUser);
    var res = await http.post(Uri.parse(registerUser),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "mobile": mobile,
          "password": password
        }));
    print(res);
    print({
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobile": mobile,
      "password": password
    });
    // if (res.statusCode == 200) {
    //   var jsonres = jsonDecode(res.body);

    //   print(jsonres);

    //   print(res.body);
    //   setLoading(false);
    // } else {
    //   var jsonres = jsonDecode(res.body);

    //   print(jsonres['message']);

    //   setLoading(false);
    // }

    return sigupResopnsModel(res.body);
  }
}
