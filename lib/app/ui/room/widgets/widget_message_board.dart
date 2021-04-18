import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/ui/room/widgets/widget_input_chat.dart';

import '../room_controller.dart';

class WidgetMessageBoard extends StatelessWidget {
  final ScrollController scrollController;

  const WidgetMessageBoard({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: GetX<RoomController>(
                builder: (RoomController controller) => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.messages.length,
                    controller: scrollController ?? ScrollController(),
                    itemBuilder: (_, index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.fromLTRB(6, 20, 6, 6)
                              : index == controller.messages.length - 1
                                  ? const EdgeInsets.fromLTRB(6, 6, 6, 20)
                                  : const EdgeInsets.all(6),
                          child: Text(controller.messages[index].msg),
                        ))),
          ),
          _buildInput()
        ],
      ),
    );
  }

  Widget _buildInput() {
    return GestureDetector(
      onTap: () => Get.dialog(WidgetInputChat()),
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            border: Border.all(color: COLOR_PRIMARY, width: 4),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: Colors.white),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: TextField(
                    enabled: false,
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
              Icon(
                Icons.send,
                color: COLOR_PRIMARY,
                size: 32,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
