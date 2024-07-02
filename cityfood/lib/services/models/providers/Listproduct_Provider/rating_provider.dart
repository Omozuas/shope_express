class ProductRating {
  int? star;
  String? postedBy;
  String? id;

  ProductRating({
    this.star,
    this.postedBy,
    this.id,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) => ProductRating(
        star: json["star"],
        postedBy: json["postedBy"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "star": star,
        "postedBy": postedBy,
        "_id": id,
      };
}
