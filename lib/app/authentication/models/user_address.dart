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
  String address;
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
    required this.address,
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
        address: json["address"] ?? '',
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
        "address": address,
        "detail": detail,
        "longitude": longitude,
        "latitude": latitude,
        "status": status == StatusAddress.primary ? 'primary' : 'secondary',
      };

  UserAddress copyWith({
    int? id,
    int? userId,
    String? title,
    String? subtitle,
    String? name,
    String? phoneNumber,
    String? address,
    String? detail,
    String? longitude,
    String? latitude,
    StatusAddress? status,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      detail: detail ?? this.detail,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'UserAddress(id: $id, userId: $userId, title: $title, subtitle: $subtitle, name: $name, phoneNumber: $phoneNumber, address: $address, detail: $detail, longitude: $longitude, latitude: $latitude, status: $status)';
  }
}
