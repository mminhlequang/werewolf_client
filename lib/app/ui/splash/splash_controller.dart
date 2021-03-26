import 'dart:developer';

import 'package:get/get.dart';

class SplashController extends GetxController{
  SplashController(){
    log("controller call!");
  }

  var count = 0.obs;
}