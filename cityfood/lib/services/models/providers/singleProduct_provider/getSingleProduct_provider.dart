import 'dart:convert';
import 'package:cityfood/services/models/providers/singleProduct_provider/singleProduct_provider.dart';

SingleProduct singleProductFromJson(String str) =>
    SingleProduct.fromJson(json.decode(str));

String singleProductToJson(SingleProduct data) => json.encode(data.toJson());

class SingleProduct {
  ProductModelById finalproduct;

  SingleProduct({
    required this.finalproduct,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
        finalproduct: ProductModelById.fromJson(json["finalProduct"]),
      );

  Map<String, dynamic> toJson() => {
        "finalProduct": finalproduct.toJson(),
      };
}
