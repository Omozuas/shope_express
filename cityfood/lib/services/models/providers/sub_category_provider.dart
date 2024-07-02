import 'dart:convert';

import 'package:cityfood/services/models/providers/category_provider.dart';

class SubCategorymodel {
  String? id;
  String? title;
  Categorymodel? categorymodel;

  SubCategorymodel({
    this.id,
    this.title,
    this.categorymodel,
  });
  factory SubCategorymodel.fromJson(Map<String, dynamic> json) =>
      SubCategorymodel(
        id: json["_id"],
        title: json["title"],
        categorymodel: Categorymodel.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": categorymodel!.toJson(),
      };
}

ListOfSubCategory listOfSubCategoryFromJson(String str) =>
    ListOfSubCategory.fromJson(json.decode(str));

String listOfSubCategoryToJson(ListOfSubCategory data) =>
    json.encode(data.toJson());

class ListOfSubCategory {
  List<SubCategorymodel> products;

  ListOfSubCategory({
    required this.products,
  });

  factory ListOfSubCategory.fromJson(Map<String, dynamic> json) =>
      ListOfSubCategory(
        products: List<SubCategorymodel>.from(
            json['getAllSubCategory'].map((x) => SubCategorymodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'getAllSubCategory':
            List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class SingleSubCategory {
  SubCategorymodel subCategorymodel;

  SingleSubCategory({
    required this.subCategorymodel,
  });

  factory SingleSubCategory.fromJson(Map<String, dynamic> json) =>
      SingleSubCategory(
        subCategorymodel: SubCategorymodel.fromJson(json["finalproduct"]),
      );

  Map<String, dynamic> toJson() => {
        "finalproduct": subCategorymodel.toJson(),
      };
}

class SubCategorymodel2 {
  String? id;
  String? title;
  String? categorymodel;

  SubCategorymodel2({
    this.id,
    this.title,
    this.categorymodel,
  });
  factory SubCategorymodel2.fromJson(Map<String, dynamic> json) =>
      SubCategorymodel2(
        id: json["_id"],
        title: json["title"],
        categorymodel: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": categorymodel,
      };
}
