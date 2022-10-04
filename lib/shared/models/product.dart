import 'package:shoeping/shared/models/product_size.dart';

import 'product_image.dart';

class Product {
  int id;
  String name;
  int brandId;
  String brandName;
  double price;
  String description;
  String image;
  List<ProductImage> images;
  List<ProductSize> sizes;

  Product({
    required this.id,
    required this.name,
    required this.brandId,
    required this.brandName,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"]?.toInt() ?? '',
        name: json["name"] ?? '',
        brandId: json["brand_id"] ?? '',
        brandName: json["brand_name"] ?? '',
        price: json["price"]?.toDouble() ?? '',
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        images: List<ProductImage>.from(
            json["images"].map((x) => ProductImage.fromJson(x))),
        sizes: List<ProductSize>.from(
            json["stocks"].map((x) => ProductSize.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand_id": brandId,
        "brand_name": brandName,
        "price": price,
        "description": description,
        "image": image,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "stocks": List<dynamic>.from(sizes.map((x) => x.toJson())),
      };
}
