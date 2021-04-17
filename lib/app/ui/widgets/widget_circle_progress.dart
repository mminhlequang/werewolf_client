import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class WidgetCircleProgress extends StatelessWidget {
  final Color color;
  final Color colorBackground;

  const WidgetCircleProgress({this.color, this.colorBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(5),
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? COLOR_PRIMARY),
          backgroundColor: colorBackground ?? COLOR_PRIMARY_LIGHT,
        ));
  }
}
