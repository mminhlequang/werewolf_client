import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';

class SignInController extends BaseController {
  final ConfigRepository _configRepository = ConfigRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final obscureText = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
