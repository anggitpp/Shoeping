import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeping/app/authentication/models/user.dart';
import 'package:shoeping/app/home/models/promo.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/models/brand.dart';

import '../../../shared/models/custom_error.dart';
import '../../../shared/models/product.dart';

class HomeRepository {
  final Dio _dio = Dio();

  Future<UserModel> getUser() async {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

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

  Future<List<Product>> getProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      var response = await _dio.get('$apiURL/products',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      List<Product> products = [];
      for (var product in response.data['data']) {
        products.add(Product.fromJson(product));
      }

      return products;
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

  Future<List<Brand>> getBrands() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      var response = await _dio.get('$apiURL/brands',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      List<Brand> brands = [];
      for (var brand in response.data['data']) {
        brands.add(Brand.fromJson(brand));
      }

      return brands;
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

  Future<List<Promo>> getPromos() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      var response = await _dio.get('$apiURL/promos',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      List<Promo> promos = [];
      for (var promo in response.data['data']) {
        promos.add(Promo.fromJson(promo));
      }

      return promos;
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
