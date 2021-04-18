import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/extensions/extensions.dart';
import 'package:werewolf_client/app/ui/ui.dart';

class WidgetRoomSetting extends StatefulWidget {
  final bool music;
  final bool sound;

  const WidgetRoomSetting({this.music = true, this.sound = true});

  @override
  _WidgetRoomSettingState createState() => _WidgetRoomSettingState();
}

class _WidgetRoomSettingState extends State<WidgetRoomSetting> {
  bool sound;
  bool music;
  RoomController controller;

  @override
  void initState() {
    super.initState();
    sound = widget.sound;
    music = widget.music;
    controller = Get.find<RoomController>();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: HexColor.fromHex("#fdfefe"),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              ("setting".tr).toUpperCase(),
              style: STYLE_MEDIUM_BOLD,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    '${'music_background'.tr}:',
                    style: STYLE_MEDIUM,
                  ),
                )),
                Switch(
                    value: music,
                    onChanged: (val) {
                      setState(() => music = val);
                      controller.changeMusicSetting(val);
                    })
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    '${'sound'.tr}:',
                    style: STYLE_MEDIUM,
                  ),
                )),
                Switch(
                    value: sound,
                    onChanged: (val) {
                      setState(() => sound = val);
                      controller.changeSoundSetting(val);
                    })
              ],
            ),
            const SizedBox(
              height: 18,
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
        ));
  }
}
