import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:werewolf_client/app/constants/constants.dart';

class WidgetRaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final BorderRadiusGeometry borderRadius;
  final double width;
  final double height;
  final Function onPressed;

  const WidgetRaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.borderRadius,
    this.width = 120,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: Colors.black54,
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: gradient ?? LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                COLOR_PRIMARY,
                COLOR_PRIMARY_DARK
              ]),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              borderRadius: borderRadius,
              child: Center(
                child: child,
              )),
        ),
      ),
    );
  }
}
