import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SplashScreenSecond.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Get.to(SplashScreenSecond()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Image.asset("assets/splash_screen1.gif"),
            )));
  }
}
