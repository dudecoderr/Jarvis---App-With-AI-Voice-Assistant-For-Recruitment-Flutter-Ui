import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Constant File/String Files/string_text.dart';
import '../Constant File/showDialogcontainer.dart';
import '../Model/Calander_day_week_model.dart';
import '../Sarvices/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///================= container day , week , month btn==========================
  RxString Week = 'Week'.obs;
  RxInt _selectedIndex = 1.obs;

  ///============================= date time calander var================
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  ///==============delete===========================
  RxBool isdelete = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
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
                      const Spacer(),
                      const Text(
                        Calendar,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: "Poppins-Light"),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),

                ///=========================== calander day , week , month ===========================
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: listCalander
                          .asMap()
                          .entries
                          .map((e) => Obx(() {
                                return Container(
                                  height: 45.h,
                                  width: 90.w,
                                  margin: EdgeInsets.only(
                                      left: (e.key == 0) ? 0 : 25),
                                  // padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _selectedIndex.value = e.key;
                                      Week.value = e.value.CalanderText!;
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: (_selectedIndex.value ==
                                                e.key)
                                            ? LinearGradient(
                                                colors: [
                                                  Colors.blue.shade900,
                                                  Colors.blue.shade900,
                                                ],
                                              )
                                            : LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Colors.white.withOpacity(.7),
                                                ],
                                              ),
                                        borderRadius:
                                            BorderRadius.circular(26.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          e.value.CalanderText.toString(),
                                          style: TextStyle(
                                            color:
                                                (_selectedIndex.value == e.key)
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      // Image.asset(e.value.CalanderText),
                                    ),
                                  ),
                                );
                              }))
                          .toList(),
                    ),
                  ),
                ),

                ///====================== calander =====================================
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 20),
                    lastDay: DateTime.utc(2040, 10, 20),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    onDaySelected: _onDaySelected,
                    locale: "en_Us",
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    calendarFormat: CalendarFormat.week,
                    availableGestures: AvailableGestures.all,
                    sixWeekMonthsEnforced: true,
                    shouldFillViewport: false,
                    headerStyle: const HeaderStyle(
                        titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w800)),
                    calendarStyle: const CalendarStyle(
                        todayTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Obx(() {
                isdelete.value;
                return FutureBuilder<List<Map<String, dynamic>>>(
                  future: DatabaseHelper().getJarvis(),
                  builder: (
                    context,
                    snap,
                  ) {
                    print("get sucessfully....${snap.data}");
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ));
                    } else if (snap.connectionState == ConnectionState.done) {
                      if (snap.hasError) {
                        return const Text('Error');
                      } else if (snap.hasData) {
                        return Stack(
                          children: [
                            AnimationLimiter(
                              child: SizedBox(
                                height: 445.h,
                                child: ListView.separated(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  shrinkWrap: true,
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, int index) {
                                    return InkWell(
                                      onLongPress: () async {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: SizedBox(
                                                height: 150.h,
                                                width: 100.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Are you sure delete?',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.sp),
                                                    ),
                                                    SizedBox(height: 20.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            height: 40.h,
                                                            width: 75.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        InkWell(
                                                          onTap: () async {
                                                            isdelete.value =
                                                                true;
                                                            isdelete.value =
                                                                false;
                                                            await DatabaseHelper()
                                                                .deleteJarvis(
                                                                    snap.data![
                                                                            index]
                                                                        ['id']);
                                                            print(
                                                                "object dekndjk==============${index}");
                                                            Get.back();
                                                          },

                                                          /// ===delete
                                                          child: Container(
                                                            height: 40.h,
                                                            width: 75.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .deepPurpleAccent
                                                                  .shade100,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  'Delete',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .primaries[Random().nextInt(
                                                      Colors.accents.length)]
                                                  .shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15.r)),
                                          height: 135.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  snap.data![index]['Title']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Text(
                                                  snap.data![index]['date']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  children: [
                                                    Text(
                                                      snap.data![index]
                                                              ['starttime']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    const Text(
                                                      " - ",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      snap.data![index]
                                                              ['lasttime']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Text(
                                                  snap.data![index]
                                                          ['discription']
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snap.connectionState}');
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 55.h,
        width: 55.h,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: ShowDialogContainer(),
                );
              },
            );
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
