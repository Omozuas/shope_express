import 'dart:convert';

import 'package:cityfood/services/models/providers/Listproduct_Provider/product_Provider.dart';

MainProduct mainProductFromJson(String str) =>
    MainProduct.fromJson(json.decode(str));

String mainProductToJson(MainProduct data) => json.encode(data.toJson());

class MainProduct {
  List<ProductModel> products;

  MainProduct({
    required this.products,
  });

  factory MainProduct.fromJson(Map<String, dynamic> json) => MainProduct(
        products: List<ProductModel>.from(
            json["Products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
