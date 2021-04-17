import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class WidgetSignInSocials extends StatelessWidget {
  final Function google;
  final Function facebook;
  final Function twitter;
  final Function apple;

  const WidgetSignInSocials(
      {this.twitter, this.google, this.facebook, this.apple});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: google,
            child: Image.asset(
              AppImages.icGoogle,
              width: 42,
              height: 42,
            )),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: facebook,
          child: Image.asset(
            AppImages.icFacebook,
            width: 46,
            height: 46,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: twitter,
          child: Image.asset(
            AppImages.icTwitter,
            width: 42,
            height: 42,
          ),
        ),
      ],
    );
  }
}
