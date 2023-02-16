import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Ui/chat_screen.dart';
import 'String Files/String_Image.dart';
import 'String Files/string_text.dart';

class CandidateContainer extends StatelessWidget {
  const CandidateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: profile1,
            name: Willam_groce,
            Comments: UI_Ux_Designer,
          ),
          SizedBox(width: 5.w),
          Category(
            image_location: profile2,
            name: Helena_Braver,
            Comments: Flutter_Developer,
          ),
          SizedBox(width: 5.w),
          Category(
            image_location: profile3,
            name: Willam_groce,
            Comments: UI_Ux_Designer,
          ),
          SizedBox(width: 5.w),
          Category(
            image_location: profile4,
            name: Helena_Braver,
            Comments: Flutter_Developer,
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String name;
  final String Comments;

  Category({
    required this.image_location,
    required this.name,
    required this.Comments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Container(
          padding: EdgeInsets.all(8),
          height: 200.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              CircleAvatar(
                backgroundImage: AssetImage(image_location),
                radius: 40,
              ),
              SizedBox(height: 8.h),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                Comments,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () {
                  Get.to(ChatScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 600));
                },
                child: const CircleAvatar(
                  backgroundColor: Color(0xFf4422EE),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  radius: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
