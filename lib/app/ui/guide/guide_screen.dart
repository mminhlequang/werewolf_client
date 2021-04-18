import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'package:werewolf_client/app/constants/constants.dart';

import '../ui.dart';
import 'widgets/widget_how_to_play.dart';
import 'widgets/widget_role_all.dart';
import 'widgets/widget_role_classic.dart';
import 'widgets/widget_tip_to_play.dart';

class GuideScreen extends BaseScreen<GuideController> {
  @override
  Widget buildUi({BuildContext context}) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: super.buildUi(context: context),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          color: COLOR_PRIMARY,
          width: Get.width,
          child: Center(
            child: Text(
              ("guide".tr).toUpperCase(),
              style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: Get.width / 6,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: GetX<GuideController>(builder: (_) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: Get.width / 12,
                        ),
                        _buildStep(index: 1, key: 'how_to_play'),
                        _buildLine(),
                        _buildStep(index: 2, key: 'role_classic'),
                        _buildLine(),
                        _buildStep(index: 3, key: 'role_all'),
                        _buildLine(),
                        _buildStep(index: 4, key: 'tip_to_play'),
                        const SizedBox(height: 25),
                      ],
                    );
                  }),
                ),
              ),
              Expanded(child: GetX<GuideController>(builder: (_) {
                Widget page;
                switch (_.step.value) {
                  case 1:
                    page = WidgetHowToPlay();
                    break;
                  case 2:
                    page = WidgetRoleClassic();
                    break;
                  case 3:
                    page = WidgetRoleAll();
                    break;
                  case 4:
                    page = WidgetTipToPlay();
                    break;
                  default:
                    page = SizedBox();
                    break;
                }
                return PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return SharedAxisTransition(
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                      );
                    },
                    child: page);
              }))
            ],
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
              child: Text('done'.tr,
                  style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildStep({int index, String key}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
          onTap: () => controller.step.value = index,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == controller.step.value
                        ? COLOR_PRIMARY
                        : TEXT_HINT_COLOR),
                child: Text(
                  '$index',
                  style: STYLE_MEDIUM.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(key.tr,
                  textAlign: TextAlign.center,
                  style: STYLE_MEDIUM.copyWith(
                      color: index == controller.step.value
                          ? COLOR_PRIMARY
                          : TEXT_HINT_COLOR)),
            ],
          )),
    );
  }

  Widget _buildLine() {
    return Container(
      width: 2,
      height: Get.height / 8,
      color: Colors.grey[300],
    );
  }
}
