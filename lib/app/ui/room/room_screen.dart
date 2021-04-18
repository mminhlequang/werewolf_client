import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/widget_header_room.dart';
import 'widgets/widget_room_member.dart';
import 'widgets/widget_message_board.dart';
import '../ui.dart';

class RoomScreen extends BaseScreen<RoomController> {
  @override
  Widget buildUi({BuildContext context}) {
    return Scaffold(
        body: WidgetBackground(
      child: super.buildUi(context: context),
    ));
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetHeaderRoom(),
        GetX<RoomController>(
          builder: (_) {
            return Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: controller.members
                    .map((e) => WidgetRoomMember(
                          size: Get.width / 4,
                          user: e,
                        ))
                    .toList());
          },
        ),
        Expanded(
            child: WidgetMessageBoard(
          scrollController: controller.messageController,
        ))
      ],
    );
  }
}
