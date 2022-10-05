class UserModel {
  int id;
  String name;
  String email;
  String photo;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? photo,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, photo: $photo)';
  }

  //fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toInt() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}
