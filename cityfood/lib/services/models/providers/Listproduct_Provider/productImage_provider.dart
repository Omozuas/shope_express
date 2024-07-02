class ProductImage {
  String? url;
  String? assetId;
  String? id;

  ProductImage({
    this.url,
    this.assetId,
    this.id,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        url: json["url"],
        assetId: json["asset_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "asset_id": assetId,
        "id": id,
      };
}
