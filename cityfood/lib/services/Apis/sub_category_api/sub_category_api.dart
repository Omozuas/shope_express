import 'dart:convert';

import 'package:cityfood/services/Apis/urlcConnection/auth_api/connectioUrl.dart';
import 'package:cityfood/services/models/providers/category_provider.dart';
import 'package:cityfood/services/models/providers/sub_category_provider.dart';
import 'package:cityfood/services/models/sub_cartegory_respons/subCategory_respons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubCategoryProviderApi with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<SubCategoryResopnsModel> createCategory(
      String title, category, token) async {
    setLoading(true);
    var createASubcategory = "${ApiUrl.subCategoryUrl}create-subcategory";
    var res = await http.post(Uri.parse(createASubcategory),
        headers: {
          'Content-Type': "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({"title": title, "category": category}));
    if (res.statusCode == 200) {
      setLoading(false);
    } else if (res.statusCode == 404) {
      setLoading(false);
    } else if (res.statusCode == 500) {
      setLoading(false);
    }

    return subCategoryResopnsModel(res.body);
  }

  Future<List<SubCategorymodel>> getAllSubCategory(token) async {
    setLoading(true);
    var getAllSubcategory = "${ApiUrl.subCategoryUrl}";
    var res = await http.get(
      Uri.parse(getAllSubcategory),
      headers: {
        'Content-Type': "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(res.body);

      final results = responseData['getSubCategory'] as List<dynamic>;
      final subCategoryModel = results.map((e) {
        final category = Categorymodel(
            id: e['category']["_id"], title: e['category']['title']);
        return SubCategorymodel(
            id: e["_id"], title: e['title'], categorymodel: category);
      }).toList();
      setLoading(false);
      return subCategoryModel;
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
