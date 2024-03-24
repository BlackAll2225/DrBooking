import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/auth_local.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth_api.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends BaseController {
  RxBool checkpassword = true.obs;
  RxBool enableButton = false.obs;
  RxString errorPhoneInput = "".obs;
  RxString errorPasswordInput = "".obs;
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  AuthApi authApi =
      BaseCommon.instance.mode == LOCAL_MODE ? AuthLocal() : AuthRemote();

  String? deviceToken;
  @override
  Future<void> onInit() async {
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

  validatePhone() {
    // phone(value);
    if (!GetUtils.isPhoneNumber(phoneTextController.text) &&
        phoneTextController.text.length != 10) {
      errorPhoneInput('Số điện thoại không hợp lệ');
    } else {
      errorPhoneInput("");
    }
    checkEnableButton();
  }

  checkEnableButton() {
    if (errorPhoneInput.isEmpty &&
        errorPasswordInput.isEmpty &&
        phoneTextController.text.trim().isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      enableButton(true);
    } else {
      enableButton(false);
    }
  }

  validatePassword() {
    if (passwordTextController.text.isEmpty) {
      errorPasswordInput('Mật khẩu không được để trống');
    } else {
      errorPasswordInput('');
    }
    checkEnableButton();
  }

  login() async {

      if (!isLockButton.value && enableButton.value) {
      isLockButton(true);
      await authApi.login(
        phone: "1-956-938-3810", password: "string"
          // phone: phoneTextController.text,
          // password: passwordTextController.text
          ).then((jwt)async{
            await BaseCommon.instance.saveToken(jwt);
            await BaseCommon.instance.decodeJWT();
            Get.offAllNamed(Routes.HOME);
            isLockButton(false);
          }).catchError((error){
              log(error.toString());
              isLockButton(false);
              UtilCommon.snackBar(text: '${error.message}');
          });
    } 
  }
}