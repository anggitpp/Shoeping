import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoeping/config/theme.dart';

import '../../../config/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RouteName.login));
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
