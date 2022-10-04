class ProductImage {
  int id;
  int productId;
  String image;
  ProductImage({
    required this.id,
    required this.productId,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "product_id": productId, "image": image};
}
