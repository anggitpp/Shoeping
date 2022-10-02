import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email)';
  }

  //fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toInt() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
