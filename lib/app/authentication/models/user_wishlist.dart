class UserWishlist {
  final int id;
  final int userId;
  final int productId;
  UserWishlist({
    required this.id,
    required this.userId,
    required this.productId,
  });

  //from json
  factory UserWishlist.fromJson(Map<String, dynamic> json) => UserWishlist(
        id: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        productId: json["product_id"] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
    };
  }
}
