import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_master/screens/loginscreen/loginscreen.dart';

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
        
        Get.offAll(SignInScreen());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Image.asset(
                          '/images/test.png',
                          width: 115,
                          height: 125,
                        )),
                  ],
                ),
              ],
            )
            )
          );
  }
}