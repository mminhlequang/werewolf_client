import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_colors.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/ui/ui.dart';

class WidgetInputChat extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WidgetKeyboardDismiss(
      child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white70,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: COLOR_PRIMARY, width: 4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Colors.white),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: TextField(
                              controller: controller,
                              style: STYLE_MEDIUM,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'input_message'.tr,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.find<RoomController>()
                                .sendMessage(controller.text);
                            controller.clear();
                          },
                          icon: Icon(
                            Icons.send,
                            color: COLOR_PRIMARY,
                            size: 32,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: GetX<RoomController>(
                    builder: (controller) => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.messages.length,
                        reverse: true,
                        shrinkWrap: true,
                        itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              child: Text(controller.messages[index].msg),
                            )),
                  ),
                ))
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: Get.height / 12),
                  child: WidgetRaisedGradientButton(
                    onPressed: () => Get.back(),
                    borderRadius: BorderRadius.circular(8),
                    child: Text(
                      'back'.tr,
                      style: STYLE_MEDIUM.copyWith(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
