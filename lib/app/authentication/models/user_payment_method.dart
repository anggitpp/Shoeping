class UserPaymentMethod {
  int id;
  int userId;
  int paymentMethodId;

  UserPaymentMethod({
    required this.id,
    required this.userId,
    required this.paymentMethodId,
  });

  factory UserPaymentMethod.fromJson(Map<String, dynamic> json) =>
      UserPaymentMethod(
        id: json["id"]?.toInt() ?? '',
        userId: json["user_id"] ?? '',
        paymentMethodId: json["payment_method_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "payment_method_id": paymentMethodId,
      };
}
