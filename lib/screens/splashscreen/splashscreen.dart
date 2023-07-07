import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_master/screens/homeScreen/homescreen.dart';
import 'package:projet_master/screens/loginscreen/loginscreen.dart';

import '../../services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      Timer(const Duration(seconds: 3), () {
        if(StorageService.getToken() != "") {
          Get.offAll(HomeScreen(email: StorageService.getEmail()));
        }else{
          Get.offAll(SignInScreen());
        }
        // Get.offAll(HomeScreen());
      });
    }
  }
  // #404E5C
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/app-logo.png',
            width: 150,
            height: 150,
            //fit: BoxFit.cover,
          ),
        )
    );
  }
}