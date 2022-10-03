class Product {
  int id;
  String name;
  int brandId;
  String brandName;
  double price;
  String description;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.brandId,
    required this.brandName,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"]?.toInt() ?? '',
        name: json["name"] ?? '',
        brandId: json["brand_id"] ?? '',
        brandName: json["brand_name"] ?? '',
        price: json["price"]?.toDouble() ?? '',
        description: json["description"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand_id": brandId,
        "brand_name": brandName,
        "price": price,
        "description": description,
        "image": image,
      };
}
