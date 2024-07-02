import 'dart:convert';

import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/category_repons/category_respons.dart';
import 'package:cityfood/services/models/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<CategoryResopnsModel> createCategory(String title, token) async {
    setLoading(true);
    var createACategory = "${ApiUrl.categoryUrl}create-category";
    var res = await http.post(Uri.parse(createACategory),
        headers: {
          'Content-Type': "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "title": title,
        }));
    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return categoryResopnsModel(res.body);
  }

  Future<ListOfCategory> getAllCategory(token) async {
    setLoading(true);
    var getAllcategory = "${ApiUrl.categoryUrl}";
    var res = await http.get(
      Uri.parse(getAllcategory),
      headers: {
        'Content-Type': "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      setLoading(false);
      return listOfCategoryFromJson(res.body);
    } else if (res.statusCode == 404) {
      setLoading(false);
      return listOfCategoryFromJson(res.body);
    } else if (res.statusCode == 500) {
      setLoading(false);
      return listOfCategoryFromJson(res.body);
    } else {
      setLoading(false);
      return listOfCategoryFromJson(res.body);
    }
  }
}
