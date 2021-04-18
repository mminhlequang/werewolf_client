import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';

class WidgetRoomRoles extends StatelessWidget {
  final List<RoleModel> roles;

  const WidgetRoomRoles({this.roles});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          color: COLOR_PRIMARY,
          width: Get.width,
          child: Center(
            child: Text(
              ("all_role_in_room".tr).toUpperCase(),
              style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: roles.length,
            itemBuilder: (context, index) {
              return Material(
                color: Colors.grey[300],
                child: StickyHeader(
                  header: Container(
                    height: 50.0,
                    color: COLOR_PRIMARY_LIGHT,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      roles[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  content: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.person_pin_outlined),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              roles[index].description,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
                color: COLOR_PRIMARY,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            height: 45,
            child: Center(
              child: Text(
                'done'.tr,
                style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
