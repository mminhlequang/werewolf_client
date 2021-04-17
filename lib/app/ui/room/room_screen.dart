import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget_room_member.dart';
import 'widget_message_board.dart';
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
      children: [
        Wrap(
          children: [WidgetRoomMember()],
        ),
        Expanded(
            child: WidgetMessageBoard(
          messages: [],
        ))
      ],
    );
  }
}
