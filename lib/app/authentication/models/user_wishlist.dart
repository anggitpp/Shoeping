import 'package:shoeping/shared/models/product.dart';

class UserWishlist {
  final int id;
  final int userId;
  final Product product;
  UserWishlist({
    required this.id,
    required this.userId,
    required this.product,
  });

  //from json
  factory UserWishlist.fromJson(Map<String, dynamic> json) => UserWishlist(
        id: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        product: Product.fromJson(json["product"] ?? ''),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      "product": product.toJson(),
    };
  }
}
