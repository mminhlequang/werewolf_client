import 'dart:developer';

import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    log("dependencies call!");
    Get.lazyPut<SplashController>(() {
      return SplashController();
    });
  }
}