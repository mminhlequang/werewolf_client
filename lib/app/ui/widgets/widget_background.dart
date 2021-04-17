import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/constants.dart';

class WidgetBackground extends StatefulWidget {
  final Widget child;

  const WidgetBackground({@required this.child, Key key}) : super(key: key);

  @override
  _WidgetBackgroundState createState() => _WidgetBackgroundState();
}

class _WidgetBackgroundState extends State<WidgetBackground>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = ColorTween(begin: BACKGROUND_LIGHT, end: BACKGROUND_DARK)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: widget.child,
        animation: controller,
        builder: (_, child) {
          return Container(
              child: child,
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                  color: animation.value,
                  image: DecorationImage(
                      image: AssetImage(AppImages.imgWerewolf),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.scaleDown)));
        });
  }
}
