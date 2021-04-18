import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_text_theme.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/utils/app_pref.dart';

import '../../ui.dart';

class WidgetProfileUser extends StatelessWidget {
  UserModel user = AppPref.user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetAvatar(
          url: user.avatar,
          radius: Get.width / 12,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.fullName,
              style: STYLE_LARGE.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  'Coin: ${user.coin}',
                  style: STYLE_MEDIUM.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
