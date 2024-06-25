import 'dart:convert';

import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/product_respons/product_respons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ProductresopnsModel> createUser(
      token,
      List<MapEntry<String, dynamic>> data,
      List<Map<String, dynamic>> images1) async {
    setLoading(true);
    var registerUser = "${ApiUrl.productUrl}add-new-product";
    // var registerUser =
    //     "http://localhost:4000/api/product/add-new-product?image";
    var res = http.MultipartRequest('POST', Uri.parse(registerUser))
      ..headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });
    for (var entry in data) {
      res.fields[entry.key] = entry.value;
      print(entry.key);
      print(entry.value);
    }

    List<http.MultipartFile> files = images1.map((file) {
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
      print(response.body);
      setLoading(false);
    } else if (response.statusCode == 404) {
      print(response.body);
      setLoading(false);
    } else if (response.statusCode == 500) {
      setLoading(false);
    }
    return ProductresopnsModel.fromJson(dd);
  }
}
