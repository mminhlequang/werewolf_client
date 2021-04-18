import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:werewolf_client/app/constants/app_colors.dart';
import 'package:werewolf_client/app/constants/app_text_theme.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/ui.dart';

class WidgetRoomMember extends StatefulWidget {
  final double size;
  final UserModel user;

  const WidgetRoomMember({this.size, this.user});

  @override
  _WidgetRoomMemberState createState() => _WidgetRoomMemberState();
}

class _WidgetRoomMemberState extends State<WidgetRoomMember> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration:
          BoxDecoration(border: Border.all(color: COLOR_PRIMARY, width: 3.5)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: ClipRRect(
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(AppImages.imgMemberBackground),
                                fit: BoxFit.fill))),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Center(
                        child: WidgetAvatar(
                          url: widget.user.avatar,
                          radius: widget.size / 4,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Container(
                  width: widget.size,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  color: Colors.white,
                  child: Text(widget.user.fullName,
                      style: STYLE_SMALL,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: widget.size / 4,
              height: widget.size / 4,
              padding: EdgeInsets.only(
                  left: widget.size / 10, bottom: widget.size / 10),
              child: Center(
                child: Text(
                  '1',
                  style: STYLE_MEDIUM.copyWith(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: COLOR_PRIMARY,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(99))),
            ),
          ),
        ],
      ),
    );
  }
}
