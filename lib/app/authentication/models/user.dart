import 'package:shoeping/app/authentication/models/user_address.dart';
import 'package:shoeping/app/authentication/models/user_payment_method.dart';
import 'package:shoeping/app/authentication/models/user_wishlist.dart';

class UserModel {
  int id;
  String name;
  String email;
  String photo;
  List<UserPaymentMethod>? paymentMethods;
  List<UserWishlist>? wishlists;
  List<UserAddress>? addresses;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.paymentMethods,
    required this.wishlists,
    required this.addresses,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? photo,
    List<UserPaymentMethod>? paymentMethods,
    List<UserWishlist>? wishlists,
    List<UserAddress>? addresses,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      wishlists: wishlists ?? this.wishlists,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, photo: $photo, paymentMethods: $paymentMethods, wishlists: $wishlists, addresses: $addresses)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        photo: json["photo"],
        paymentMethods: json["payment_methods"] == null
            ? null
            : List<UserPaymentMethod>.from(json["payment_methods"]
                .map((x) => UserPaymentMethod.fromJson(x))),
        wishlists: json["wishlists"] == null
            ? null
            : List<UserWishlist>.from(
                json["wishlists"].map((x) => UserWishlist.fromJson(x))),
        addresses: json["addresses"] == null
            ? null
            : List<UserAddress>.from(
                json["addresses"].map((x) => UserAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "photo": photo,
        "payment_methods": paymentMethods == null
            ? null
            : List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
        "wishlists": wishlists == null
            ? null
            : List<dynamic>.from(wishlists!.map((x) => x.toJson())),
        "addresses": addresses == null
            ? null
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}
