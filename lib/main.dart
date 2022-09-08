import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/routes.dart';
import '../config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoeping',
      theme: darkTheme,
      routes: routes,
    );
  }
}
