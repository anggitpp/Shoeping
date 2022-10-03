class Brand {
  int id;
  String name;
  String image;
  String description;

  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        description: json["description"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
      };
}
