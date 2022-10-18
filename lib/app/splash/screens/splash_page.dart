import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoeping/config/theme.dart';

import '../../../config/route_name.dart';
import '../../../shared/utils/database_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late StreamSubscription<User?> _listener;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      _listener = FirebaseAuth.instance.authStateChanges().listen((User? user) {
        Navigator.pushReplacementNamed(
                context, user == null ? RouteName.login : RouteName.main)
            .then((value) async {
          await DatabaseHelper.instance.database;
        });
      });
    });
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 100, height: 100),
            const SizedBox(height: 10),
            Text(
              'Shoeping',
              style: veryLargeText.copyWith(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
