import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoeping/config/constant.dart';
import 'package:shoeping/shared/models/custom_error.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

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
    } on FirebaseAuthException catch (e) {
      String code = e.code;
      String message = e.message!;
      if (e.code == 'email-already-in-use') {
        code = 'Email sudah terdaftar';
        message =
            'Email yang anda gunakan sudah terdaftar, silahkan login dengan email tersebut atau gunakan fitur lupa password';
      }
      throw CustomError(code: code, message: message, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }
}
