enum PromoType {
  percent,
  price,
}

class Promo {
  int id;
  String name;
  String code;
  String description;
  String image;
  PromoType type;
  int value;

  Promo({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.image,
    required this.type,
    required this.value,
  });

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        id: json["id"]?.toInt() ?? 0,
        name: json["name"] ?? '',
        code: json["code"] ?? '',
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        type: json["type"] == 'price' ? PromoType.price : PromoType.percent,
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "image": image,
        "type": type == PromoType.price ? 'price' : 'percent',
        "value": value,
      };
}
