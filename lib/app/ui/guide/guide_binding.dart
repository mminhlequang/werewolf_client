import 'package:get/get.dart';

import 'guide.dart';

class GuideBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<GuideController>(GuideController());
  }
}