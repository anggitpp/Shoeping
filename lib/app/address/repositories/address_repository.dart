import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constant.dart';
import '../../../shared/models/custom_error.dart';
import '../../authentication/models/user_address.dart';

class AddressRepository {
  final Dio _dio = Dio();

  Future<void> storeAddress(UserAddress address) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      await _dio.post(
        '$apiURL/address/store',
        data: address.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
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
