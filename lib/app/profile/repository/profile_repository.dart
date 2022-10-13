import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constant.dart';
import '../../../shared/models/custom_error.dart';

class ProfileRepository {
  final Dio _dio = Dio();

  Future<void> updateProfile({required String name, File? file}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      String? fileName = file?.path.split('/').last;
      FormData formData = FormData.fromMap({
        "name": name,
      });
      if (fileName != null) {
        formData.files.addAll([
          MapEntry("image_files", await MultipartFile.fromFile(file!.path)),
        ]);
      }

      var response = await _dio.post('$apiURL/editProfile',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: formData);

      return response.data;
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
