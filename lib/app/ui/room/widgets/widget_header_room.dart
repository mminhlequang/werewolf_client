import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_colors.dart';
import 'package:werewolf_client/app/constants/app_text_theme.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/room/room.dart';

import 'widget_room_roles.dart';
import 'widget_setting.dart';

class WidgetHeaderRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 35,
        color: COLOR_PRIMARY_DARK,
        child: Row(
          children: [
            Expanded(
              child: GetX<RoomController>(
                builder: (controller) => controller.roles.value.isEmpty
                    ? SizedBox()
                    : Row(
                        children: [
                          InkWell(
                            onTap: () => Get.dialog(
                                WidgetRoomRoles(roles: controller.roles.value)),
                            child: Icon(
                              Icons.contacts_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: InkWell(
                                    onTap: () => Get.dialog(WidgetRoomRoles(
                                        roles: controller.roles.value)),
                                    child: Text(_detail(controller.roles.value),
                                        style: STYLE_MEDIUM.copyWith(
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            FittedBox(
              child: InkWell(
                  borderRadius: BorderRadius.circular(99),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => Get.dialog(WidgetRoomSetting())),
            ),
            const SizedBox(
              width: 6,
            )
          ],
        ));
  }

  String _detail(List<RoleModel> roles) {
    int villager = 0;
    int wolf = 0;
    int other = 0;
    roles.forEach((role) {
      if (role.sectarians.contains(1)) villager++;
      if (role.sectarians.contains(2)) wolf++;
      if (role.sectarians.contains(3)) other++;
    });
    return "Villager: $villager - Wolf: $wolf - Other: $other";
  }
}
