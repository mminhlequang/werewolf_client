import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class WidgetRaisedOutlineButton extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;
  final Color color;
  final double width;
  final double height;
  final Function onPressed;

  const WidgetRaisedOutlineButton({
    Key key,
    @required this.child,
    this.color,
    this.borderWidth,
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
          color: Colors.white,
          borderRadius: borderRadius,
          border: Border.all(
              color: color ?? Colors.black54, width: borderWidth ?? 2),
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
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
