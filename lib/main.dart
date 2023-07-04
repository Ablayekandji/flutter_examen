import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_master/screens/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
