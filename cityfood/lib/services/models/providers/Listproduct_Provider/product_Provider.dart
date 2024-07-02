import 'package:cityfood/services/models/providers/Listproduct_Provider/productImage_provider.dart';
import 'package:cityfood/services/models/providers/Listproduct_Provider/rating_provider.dart';

class ProductModel {
  String id;
  String title;
  String slug;
  String description;
  String brand;
  int price;
  int sold;
  int quantity;
  final category;
  final subCategory;
  List<ProductImage> images;
  final totalrating;
  List<ProductRating>? ratings;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.brand,
    required this.price,
    required this.sold,
    required this.quantity,
    required this.category,
    required this.subCategory,
    required this.images,
    required this.totalrating,
    this.ratings,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        brand: json["brand"],
        price: json["price"],
        sold: json["sold"],
        quantity: json["quantity"],
        category: json['category'],
        subCategory: json['subCategory'],
        images: List<ProductImage>.from(
            json["images"].map((x) => ProductImage.fromJson(x))),
        totalrating: json["totalrating"],
        ratings: List<ProductRating>.from(
            json["ratings"].map((x) => ProductRating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "brand": brand,
        "price": price,
        "sold": sold,
        "quantity": quantity,
        "category": category,
        "subCategory": subCategory,
        "images": List<ProductImage>.from(images.map((x) => x.toJson())),
        "totalrating": totalrating,
        "ratings": List<ProductRating>.from(ratings!.map((x) => x.toJson())),
      };
}
