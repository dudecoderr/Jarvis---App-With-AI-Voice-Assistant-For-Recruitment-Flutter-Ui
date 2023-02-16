import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../Constant File/String Files/string_text.dart';
import '../../Controller/dashboard_screen_controller.dart';
import '../dashboardScreen.dart';

class SplashScreenSecond extends StatelessWidget {
  SplashScreenSecond({Key? key}) : super(key: key);
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF3FF),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 380.h,
              child: AspectRatio(
                aspectRatio: dashboardController.controller.value.aspectRatio,
                child: VideoPlayer(dashboardController.controller),
              ),
            ),
          ),
          Positioned(
            bottom: 240,
            left: 150,
            child: Text(
              Jarvis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.sp,
                  fontFamily: 'Poppins-SemiBold',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 55.h,
                  width: 390.w,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(DashboardScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue.shade900,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        Getstarted,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-SemiBold',
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )),
                )),
          )
        ],
      ),
    );
  }
}
