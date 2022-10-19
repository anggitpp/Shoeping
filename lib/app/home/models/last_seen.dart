class LastSeen {
  int id;
  int productId;
  String seenDate;
  LastSeen({
    required this.id,
    required this.productId,
    required this.seenDate,
  });

  factory LastSeen.fromJson(Map<String, dynamic> json) => LastSeen(
        id: json["id"] ?? '',
        productId: json["product_id"] ?? '',
        seenDate: json["seen_date"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "seen_date": seenDate,
      };

  LastSeen copyWith({
    int? id,
    int? productId,
    String? seenDate,
  }) {
    return LastSeen(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      seenDate: seenDate ?? this.seenDate,
    );
  }

  @override
  String toString() =>
      'LastSeen(id: $id, productId: $productId, seenDate: $seenDate)';
}
