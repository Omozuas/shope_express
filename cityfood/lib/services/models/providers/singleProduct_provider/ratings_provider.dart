import 'package:cityfood/services/models/providers/singleProduct_provider/postedBy_provider.dart';

class SingleRating {
  int? star;
  PostedBy? postedBy;
  String? id;

  SingleRating({
    this.star,
    this.postedBy,
    this.id,
  });

  factory SingleRating.fromJson(Map<String, dynamic> json) => SingleRating(
        star: json["star"],
        postedBy: PostedBy.fromJson(json["postedBy"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "star": star,
        "postedBy": postedBy!.toJson(),
        "_id": id,
      };
}
