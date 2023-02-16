import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../Constant File/String Files/string_text.dart';
import '../Controller/dashboard_screen_controller.dart';
import 'Splash Screen File/SplashScreenThree.dart';
import 'candidates_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    dashboardController.startAnimation();
    return Scaffold(
      // backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          SizedBox(
            // color: Colors.yellow,
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Obx(
                      () => AnimatedPositioned(
                        duration: Duration(milliseconds: 1000),
                        top: dashboardController.animate.value ? 45 : 0,
                        right: 170,

                        // right: constraints.maxWidth * 0.05,
                        child: Text(
                          Jarvis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          ///===================== second container
          Container(
            // color: Colors.red,
            height: 480.h,
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Obx(
                      () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 1000),
                        top: dashboardController.animate.value ? 45 : 0,
                        left: dashboardController.animate.value ? 15 : 0,
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 2),
                          opacity: dashboardController.animate.value ? 1 : 0,
                          child: Text(
                            How_can,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins-Light"),
                          ),
                        ),
                      ),
                    ),
                    //=============================calander btn ===========
                    Obx(
                      () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 1000),
                        top: dashboardController.animate.value ? 120 : 0,
                        left: dashboardController.animate.value ? 25 : 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      Calendar,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            //=========================== Action center ===============
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      Action_Center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.equalizer,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      CRM,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            //==========================Account Settings ======================
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      Account_Settings,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            //============================== Reports ===========================
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.content_paste,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      Reports,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity:
                                  dashboardController.animate.value ? 1 : 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.dashboard,
                                      color: Colors.blue.shade900,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      Dashboard,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Spacer(),

          ///=========================== bottom container ==================================
          Container(
            // color: Colors.yellow,
            decoration: BoxDecoration(color: Color(0xFFEAF3FF)),
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(CandidatesScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 600));
                  },
                  child: Icon(Icons.admin_panel_settings, size: 30.sp),
                ),

                ///======================================== video player =======================================

                InkWell(
                  onTap: () {
                    Get.to(SplashScreenThree(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1));
                  },
                  child: Container(
                    // color: Colors.yellow,
                    height: 80.h,
                    width: 130.w,
                    child: AspectRatio(
                      aspectRatio:
                          dashboardController.controller.value.aspectRatio,
                      child: VideoPlayer(dashboardController.controller),
                    ),
                  ),
                ),

                Icon(
                  Icons.menu,
                  size: 30.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
