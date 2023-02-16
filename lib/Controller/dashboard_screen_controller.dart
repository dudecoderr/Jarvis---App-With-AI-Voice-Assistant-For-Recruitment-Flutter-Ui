import 'dart:async';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DashboardController extends GetxController {
  static DashboardController get find => Get.find();

  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    animate.value = true;
  }

  ///================= video ==============================
  late VideoPlayerController controller;

  @override
  void onInit() {
    super.onInit();

    controller = VideoPlayerController.network(
        'https://cdn.dribbble.com/userupload/3720196/file/original-d76feb2b45ab041cf92a6b43c65fb730.mp4')
      ..initialize();
    controller.play();
    controller.setLooping(true);
  }
}
