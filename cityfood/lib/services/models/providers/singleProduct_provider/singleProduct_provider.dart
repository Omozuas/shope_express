import 'package:cityfood/services/models/providers/Listproduct_Provider/productImage_provider.dart';
import 'package:cityfood/services/models/providers/Listproduct_Provider/rating_provider.dart';
import 'package:cityfood/services/models/providers/category_provider.dart';
import 'package:cityfood/services/models/providers/singleProduct_provider/ratings_provider.dart';
import 'package:cityfood/services/models/providers/sub_category_provider.dart';

class ProductModelById {
  String id;
  String title;
  String slug;
  String description;
  String brand;
  int price;
  int sold;
  int quantity;
  Categorymodel category;
  // SubCategorymodel2 subCategory;
  List<ProductImage> images;
  final totalrating;
  List<SingleRating>? ratings;

  ProductModelById({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.brand,
    required this.price,
    required this.sold,
    required this.quantity,
    required this.category,
    // required this.subCategory,
    required this.images,
    required this.totalrating,
    this.ratings,
  });

  factory ProductModelById.fromJson(Map<String, dynamic> json) =>
      ProductModelById(
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        brand: json["brand"],
        price: json["price"],
        sold: json["sold"],
        quantity: json["quantity"],
        category: Categorymodel.fromJson(json['category']),
        // subCategory: SubCategorymodel2.fromJson(json['subCategory']),
        images: List<ProductImage>.from(
            json["images"].map((x) => ProductImage.fromJson(x))),
        totalrating: json["totalrating"],
        ratings: List<SingleRating>.from(
            json['ratings'].map((x) => SingleRating.fromJson(x))),
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
        "category": category.toJson(),
        // "subCategory": subCategory.toJson(),
        "images": List<ProductImage>.from(images.map((x) => x.toJson())),
        "totalrating": totalrating,
        "ratings": List<SingleRating>.from(ratings!.map((x) => x.toJson()))
      };
}
