import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant File/String Files/String_Image.dart';
import '../Constant File/String Files/string_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height: 100.h,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 42, left: 10, right: 10),
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
                                  Spacer(),
                                  const Text(
                                    Serigo_Pliegho,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                  const Spacer(),
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(profile1),
                                    radius: 28,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      Hello,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      I_have_already,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      height: 200.h,
                                      width: 250.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: Image.asset(game)),
                                ),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFf4422EE).withOpacity(0.25),
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      WOW_Looks,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 1, top: 1),
              height: 85,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const <Widget>[
                    SizedBox(
                      width: 270,
                      child: TextField(
                        // controller: chatController.messageTextEditingController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: Write_message,
                            hintStyle:
                                TextStyle(color: Colors.black54, fontSize: 12),
                            border: InputBorder.none),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
