import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';

import '../ui.dart';
import 'widgets/widget_profile_user.dart';

class NavigationScreen extends BaseScreen<NavigationController> {
  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            color: Color.fromRGBO(33, 32, 52, 1),
            image: DecorationImage(
                image: AssetImage(AppImages.imgWerewolf),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.scaleDown)),
        // child: GetX<NavigationController>(builder: (_) => _buildBody()),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned(
            top: 16,
            right: 16,
            child: InkWell(
                borderRadius: BorderRadius.circular(99),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                onTap: () => Get.dialog(WidgetRoomSetting()))),
        Positioned(top: 16, left: 16, child: WidgetProfileUser()),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetRaisedGradientButton(
                onPressed: () => Get.toNamed(Routes.ROOM),
                width: Get.width * 3 / 5,
                height: 45,
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [COLOR_PRIMARY, COLOR_PRIMARY_DARK]),
                child: Text(
                  'play_now'.tr.toUpperCase(),
                  style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetRaisedOutlineButton(
                onPressed: () => Get.toNamed(Routes.GUIDE),
                height: 45,
                width: Get.width * 3 / 5,
                color: COLOR_PRIMARY,
                borderRadius: BorderRadius.circular(4),
                child: Text('guide'.tr.toUpperCase(),
                    style:
                        STYLE_MEDIUM_BOLD.copyWith(color: COLOR_PRIMARY_DARK)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
