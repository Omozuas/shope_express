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

  Future<CategoryResopnsModel> createCategory(String title) async {
    setLoading(true);
    var create_A_Category = "${ApiUrl.categoryUrl}create-category";
    var res = await http.post(Uri.parse(create_A_Category),
        headers: {'Content-Type': "application/json"},
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

  Future<List<Categorymodel>> getAllCategory(token) async {
    setLoading(true);
    var create_A_Category = "${ApiUrl.categoryUrl}";
    var res = await http.get(
      Uri.parse(create_A_Category),
      headers: {
        'Content-Type': "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      final results = responseData['getAllCategory'] as List<dynamic>;
      final categoryModel = results.map((e) {
        return Categorymodel(id: e["_id"], title: e['title']);
      }).toList();
      setLoading(false);
      return categoryModel;
    } else if (res.statusCode == 404) {
      setLoading(false);
      return [];
    } else if (res.statusCode == 500) {
      setLoading(false);
      return [];
    } else {
      setLoading(false);
      return [];
    }
  }
}
