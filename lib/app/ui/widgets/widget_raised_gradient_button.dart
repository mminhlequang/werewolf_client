import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            borderRadius: borderRadius,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
