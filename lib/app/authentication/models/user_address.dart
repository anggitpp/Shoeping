enum StatusAddress {
  primary,
  secondary,
}

class UserAddress {
  int id;
  int userId;
  String title;
  String subtitle;
  String name;
  String phoneNumber;
  String detail;
  String longitude;
  String latitude;
  StatusAddress status;

  UserAddress({
    required this.id,
    required this.userId,
    required this.title,
    required this.subtitle,
    required this.name,
    required this.phoneNumber,
    required this.detail,
    required this.longitude,
    required this.latitude,
    required this.status,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        id: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        title: json["title"] ?? '',
        subtitle: json["subtitle"] ?? '',
        name: json["name"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        detail: json["detail"] ?? '',
        longitude: json["longitude"] ?? '',
        latitude: json["latitude"] ?? '',
        status: json["status"] == 'primary'
            ? StatusAddress.primary
            : StatusAddress.secondary,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "subtitle": subtitle,
        "name": name,
        "phone_number": phoneNumber,
        "detail": detail,
        "longitude": longitude,
        "latitude": latitude,
        "status": status == StatusAddress.primary ? 'primary' : 'secondary',
      };
}
