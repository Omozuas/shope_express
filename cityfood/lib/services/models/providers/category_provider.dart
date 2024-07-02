import 'dart:convert';

class Categorymodel {
  String? id;
  String? title;

  Categorymodel({
    this.id,
    this.title,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
        id: json["_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
      };
}

ListOfCategory listOfCategoryFromJson(String str) =>
    ListOfCategory.fromJson(json.decode(str));

String listOfCategoryToJson(ListOfCategory data) => json.encode(data.toJson());

class ListOfCategory {
  List<Categorymodel> products;

  ListOfCategory({
    required this.products,
  });

  factory ListOfCategory.fromJson(Map<String, dynamic> json) => ListOfCategory(
        products: List<Categorymodel>.from(
            json["getAllCategory"].map((x) => Categorymodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getAllCategory": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class SingleCategory {
  Categorymodel categorymodel;

  SingleCategory({
    required this.categorymodel,
  });

  factory SingleCategory.fromJson(Map<String, dynamic> json) => SingleCategory(
        categorymodel: Categorymodel.fromJson(json["finalproduct"]),
      );

  Map<String, dynamic> toJson() => {
        "finalproduct": categorymodel.toJson(),
      };
}
