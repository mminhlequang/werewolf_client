import 'package:flutter/material.dart';

class WidgetMessageBoard extends StatelessWidget {
  final List<String> messages;
  final ScrollController controller;

  const WidgetMessageBoard({this.messages, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          reverse: true,
          controller: controller ?? ScrollController(initialScrollOffset: 0),
          itemCount: messages.length,
          itemBuilder: (_, index) => Text(messages[index])),
    );
  }
}
