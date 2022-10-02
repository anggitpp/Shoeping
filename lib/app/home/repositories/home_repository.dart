import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeping/app/authentication/models/user.dart';
import 'package:shoeping/config/constant.dart';

import '../../../shared/models/custom_error.dart';

class HomeRepository {
  final Dio _dio = Dio();

  Future<UserModel> getUser() async {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;

      //get token from shared preferences token
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String token = sharedPreferences.getString('token')!;

      var response = await _dio.get('$apiURL/user',
          queryParameters: {'email': email},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return UserModel.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw CustomError(
          code: e.response!.statusCode.toString(),
          message: e.response!.data!['error'],
          plugin: 'server error');
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }
}
