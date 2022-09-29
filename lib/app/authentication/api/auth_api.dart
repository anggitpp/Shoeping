// import 'package:dio/dio.dart';
// import 'package:shoeping/config/constant.dart';
// import 'package:shoeping/shared/models/api_response.dart';

// class AuthApi {
//   final Dio _dio;

//   AuthApi(this._dio);

//   Future<ApiResponse> login(String email, String password) async {
//     final response = await _dio.post(
//       '/auth/login',
//       data: {'email': email, 'password': password},
//     );
//     return ApiResponse.fromJson(response.data);
//   }

//   Future<ApiResponse> register(
//       String name, String email, String password) async {
//     try {
//       final response = await _dio.post(
//         '$apiURL/register',
//         data: {'name': name, 'email': email, 'password': password},
//       );

//       return ApiResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       return ApiResponse.fromJson(e.response.toString());
//     }
//   }
// }
