import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Sarvices/database.dart';
import '../Sarvices/jarvis_localdata_store_modal.dart';
import 'String Files/string_text.dart';

class ShowDialogContainer extends StatefulWidget {
  const ShowDialogContainer({Key? key}) : super(key: key);

  @override
  State<ShowDialogContainer> createState() => _ShowDialogContainerState();
}

class _ShowDialogContainerState extends State<ShowDialogContainer> {
  final _formKey = GlobalKey<FormState>();

  ///=================text filde controller====================
  final TitleController = TextEditingController();
  final dateController = TextEditingController();
  final StartTimeController = TextEditingController();
  final EndTimeController = TextEditingController();
  final DescriptionController = TextEditingController();
  final colorController = TextEditingController();

  ///========================= select color =========
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      width: 350.w,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    size: 25.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: TitleController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: Title_text,
                ),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: dateController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: Date,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SizedBox(
                    width: 90.w,
                    child: TextFormField(
                      controller: StartTimeController,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: Start_Time,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 90.w,
                    child: TextFormField(
                      controller: EndTimeController,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        hintText: End_Time,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: DescriptionController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: Description,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                Meeting_Type,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Center(
                          child: Text(
                        "Interview",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ))),
                  Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Center(
                          child: Text(
                        "TeamMeet",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ))),
                  Container(
                      height: 40.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Center(
                          child: Text(
                        "Other",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ))),
                ],
              ),
              SizedBox(height: 22.h),
              SizedBox(
                height: 45.h,
                width: 330.w,
                child: ElevatedButton(
                    onPressed: () async {
                      DatabaseHelper()
                          .addJarvis(Jarvisevoices(
                              Title: TitleController.text,
                              date: dateController.text,
                              starttime: StartTimeController.text,
                              lasttime: EndTimeController.text,
                              discription: DescriptionController.text))
                          .whenComplete(() => setState(() {}));
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: const Text(
                      Create,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins-Light",
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
