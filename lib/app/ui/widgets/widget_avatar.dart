import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_client/app/constants/constants.dart';

class WidgetAvatar extends StatelessWidget {
  final double radius;
  final String url;
  final double border;

  const WidgetAvatar({@required this.radius, @required this.url, this.border});

  Widget _buildErrorImage() => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: Image.asset(
          AppImages.imgMemberAvatar,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: COLOR_PRIMARY_DARK,
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius - (border ?? 0),
          child: KeyedSubtree(
              key: UniqueKey(),
              child: url == null || url.trim().isEmpty
                  ? _buildErrorImage()
                  : CachedNetworkImage(
                      imageUrl: url,
                      imageBuilder: (_, img) => CircleAvatar(
                        radius: radius,
                        backgroundImage: img,
                        backgroundColor: Colors.white,
                      ),
                      errorWidget: (_, __, ___) => _buildErrorImage(),
                    ))),
    );
  }
}
