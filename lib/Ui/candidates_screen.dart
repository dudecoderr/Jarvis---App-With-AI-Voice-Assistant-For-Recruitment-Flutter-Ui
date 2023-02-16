import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:video_player/video_player.dart';

import '../Constant File/String Files/string_text.dart';
import '../Constant File/candidate_container_constant.dart';
import '../Controller/dashboard_screen_controller.dart';

class CandidatesScreen extends StatefulWidget {
  CandidatesScreen({Key? key}) : super(key: key);

  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 45, left: 10, right: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                                size: 25.sp,
                              ),
                            ),
                            SizedBox(width: 110.w),
                            const Text(
                              Candidates,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontFamily: "Poppins-Light"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              Overview,
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: "Poppins-Light"),
                            ),
                            Spacer(),
                            Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.purple.withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.filter_alt_outlined,
                                      color: Colors.purple.shade900),
                                  Text(
                                    Filter,
                                    style: TextStyle(
                                        color: Colors.purple.shade900,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),

                      ///============== candidate email container
                      CandidateContainer(),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 85.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              border: Border.all(color: Colors.grey.shade400)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                randomBetween(50, 600).toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.sp),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                Total_Candidates,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 85.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              border: Border.all(color: Colors.grey.shade400)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                randomBetween(50, 200).toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.sp),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                Total_Active_Candidates,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFEAF3FF)),
              height: 90.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.to(HomePage());
                    },
                    child: Icon(Icons.keyboard, size: 30.sp),
                  ),
                  Container(
                    // color: Colors.yellow,
                    height: 80.h,
                    width: 130.w,
                    child: AspectRatio(
                      aspectRatio:
                          dashboardController.controller.value.aspectRatio,
                      child: VideoPlayer(dashboardController.controller),
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    size: 30.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
