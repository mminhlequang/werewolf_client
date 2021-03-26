import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';

import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text("${controller.count}")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.count.value++;
        },
      ),
    );
  }
}
