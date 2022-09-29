import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/models/custom_error.dart';
import 'package:shoeping/shared/utils/custom_error_message.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  final Dio _dio = Dio();

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final signedUser = userCredential.user!;

      await userCollection.doc(signedUser.uid).set({
        'name': name,
        'email': email,
      });

      await _dio.post(
        '$apiURL/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    } on FirebaseAuthException catch (e) {
      String code = e.code;
      String message = CustomErrorMessage().firebaseErrorMessage(code);
      throw CustomError(code: code, message: message, plugin: e.plugin);
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

  // Future<UserModel?> getUser({required String email}) async {
  //   try {
  //     var response = await Dio().get('$apiURL/user', queryParameters: {
  //       'email': email,
  //     });

  //     return UserModel.fromJson(response.data['data']);
  //   } on DioError catch (e) {
  //     if (e.response!.statusCode == 404) {
  //       print(e.response!.statusCode);
  //       print(e.response!.data);
  //     } else {
  //       print(e.message);
  //     }

  //     throw CustomError(
  //         code: e.response!.statusCode.toString(),
  //         message: e.response!.statusMessage!,
  //         plugin: 'error dio');
  //   } catch (e) {
  //     throw CustomError(
  //         code: 'Exception',
  //         message: e.toString(),
  //         plugin: 'flutter_error/server_error');
  //   }

  // }

  // return null;
  // }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String code = e.code;
      String message = CustomErrorMessage().firebaseErrorMessage(code);
      throw CustomError(code: code, message: message, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signOut() async {
    try {
      print('signing out repo');
      await FirebaseAuth.instance.signOut();
      print('signed out repo');
    } on FirebaseAuthException catch (e) {
      String code = e.code;
      String message = CustomErrorMessage().firebaseErrorMessage(code);
      throw CustomError(code: code, message: message, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }
}
