import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class WidgetKeyboardDismiss extends StatelessWidget {
  final Widget child;

  const WidgetKeyboardDismiss({@required this.child});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: child,
      gestures: [
        GestureType.onTap,
        GestureType.onDoubleTap,
        GestureType.onLongPress
      ],
    );
  }
}
