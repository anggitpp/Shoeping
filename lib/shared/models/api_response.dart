import 'dart:convert';

class ApiResponse {
  int statusCode;
  String message;
  ApiResponse({
    required this.statusCode,
    required this.message,
  });

  bool isSuccess() {
    return statusCode >= 200 && statusCode < 300;
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      statusCode: map['statusCode']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}
