import 'dart:async';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/confirm_otp_payload.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends BaseController {
  final countDown = 59.obs;
  TextEditingController emailController = TextEditingController(text: '');
  String code = '';
  @override
  Future<void> onInit() async {
    await sendOTP();
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

  sendOTP() async {
    await AuthRemote().sendEmailOTP().then((value) {
      if (!value) {
        Get.back();
        UtilCommon.snackBar(text: 'Có gì đó không đúng', isFail: true);
      }
    }).catchError(handleError);
  }

  confirmOTP(String code) async {
    await AuthRemote()
        .confirmOTP(payload: ConfirmOtpPayload(deviceToken: 'hi', otp: code))
        .then((jwt) async {
      await BaseCommon.instance.saveToken(jwt);
      await BaseCommon.instance.decodeJWT();
      Get.offAllNamed(Routes.HOME);
        UtilCommon.snackBar(text: 'Xác thực thành công', );
    }).catchError(handleError);
  }
}
