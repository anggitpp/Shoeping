class ProductSize {
  int id;
  int productId;
  String size;
  int stock;

  ProductSize({
    required this.id,
    required this.productId,
    required this.size,
    required this.stock,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
        id: json["id"]?.toInt() ?? '',
        productId: json["product_id"] ?? '',
        size: json["size"] ?? '',
        stock: json["stock"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "size": size,
        "stock": stock,
      };
}
