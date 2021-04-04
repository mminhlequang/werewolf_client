import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/constants/app_images.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/ui/widgets/widget_back_button.dart';
import 'package:werewolf_client/app/ui/widgets/widget_input_underline.dart';
import 'package:werewolf_client/app/ui/widgets/widget_raised_gradient_button.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';

import 'sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  SignInController _controller = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: WidgetBackButton(),
                ),
                Expanded(
                    child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 80),
                      child: Form(
                        key: _controller.formKey,
                        child: GetX(
                          builder: (_) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi wolf!',
                                  style: STYLE_SMALL_BOLD.copyWith(
                                      fontSize: 32, color: COLOR_PRIMARY_DARK),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'sign_in_description'.tr,
                                  style: STYLE_LARGE.copyWith(
                                      color: COLOR_PRIMARY_LIGHT),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 65,
                                ),
                                WidgetInputUnderline(
                                  controller: _controller.usernameController,
                                  hint: 'Username...',
                                  hintStyle: STYLE_MEDIUM.copyWith(
                                      color: COLOR_PRIMARY_LIGHT),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                WidgetInputUnderline(
                                  controller: _controller.passwordController,
                                  hint: 'Password...',
                                  suffixIcon: _controller.obscureText.value
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.visibility_off_rounded,
                                            color: COLOR_PRIMARY_LIGHT,
                                          ),
                                          onPressed: () => _controller
                                              .obscureText.value = false)
                                      : IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye_rounded,
                                              color: COLOR_PRIMARY_LIGHT),
                                          onPressed: () => _controller
                                              .obscureText.value = true),
                                  obscureText: _controller.obscureText.value,
                                  inputType: TextInputType.visiblePassword,
                                  hintStyle: STYLE_MEDIUM.copyWith(
                                      color: COLOR_PRIMARY_LIGHT),
                                ),
                                const SizedBox(
                                  height: 65,
                                ),
                                Center(
                                  child: WidgetRaisedGradientButton(
                                    onPressed: () {},
                                    width: Get.width * 3 / 5,
                                    height: 45,
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          COLOR_PRIMARY,
                                          COLOR_PRIMARY_DARK
                                        ]),
                                    child: Text(
                                      'sign_in'.tr.toUpperCase(),
                                      style: STYLE_MEDIUM_BOLD.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Text(
                                    'forgot_password'.tr,
                                    style: STYLE_SMALL_BOLD.copyWith(
                                        color: COLOR_PRIMARY),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        height: 0.8,
                                        color: COLOR_PRIMARY_LIGHT,
                                        width: Get.width,
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 24),
                                        child: Text(
                                          'or',
                                          style: STYLE_MEDIUM_BOLD.copyWith(
                                              color: COLOR_PRIMARY,
                                              fontWeight: FontWeight.w800),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: 0.8,
                                        color: COLOR_PRIMARY_LIGHT,
                                        width: Get.width,
                                      )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'social_media_login'.tr,
                                    style: STYLE_SMALL_BOLD.copyWith(
                                        color: COLOR_PRIMARY_LIGHT),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          AppImages.icFacebook,
                                          width: 42,
                                          height: 42,
                                        )),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Image.asset(
                                        AppImages.icFacebook,
                                        width: 42,
                                        height: 42,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 45,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'do_not_have_an_account'.tr,
                                      style: STYLE_SMALL_BOLD.copyWith(
                                          color: COLOR_PRIMARY_LIGHT),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    InkWell(
                                      onTap: () => Get.offNamed(Routes.SIGN_UP),
                                      child: Text(
                                        'sign_up'.tr,
                                        style: STYLE_SMALL_BOLD.copyWith(
                                            color: COLOR_PRIMARY),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
