import 'dart:async';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends BaseController {

  final countDown = 59.obs;
  TextEditingController emailController = TextEditingController(text: '');
  String code = '';
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  countDownFunction() {
    countDown(59);
    Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => {
              if (countDown == 0)
                {
                  timer.cancel(),
                }
              else
                {
                  countDown.value--,
                }
            });
  }
}
