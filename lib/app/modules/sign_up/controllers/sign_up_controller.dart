import 'dart:async';
import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

   RxBool checkpassword = true.obs;
  RxBool enableButton = false.obs;
  RxString errorPhoneInput = "".obs;
  RxString errorPasswordInput = "".obs;
  RxString errorEmail = "".obs;
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController rePasswordTextController = TextEditingController();

  TextEditingController emailController = TextEditingController(text: '');

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
  
  validateEmail() {
    if (emailController.text.trim().isEmpty) {
      return errorEmail('Email không được để trống');
    } else if (!emailController.text.isEmail) {
      return errorEmail('Email không đúng chuẩn abc@gmail.com');
    }
    return errorEmail('');
  }

  validatePhone() {
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
    } else if (passwordTextController.text != rePasswordTextController.text) {
      errorPasswordInput('Mật khẩu nhập lại phải trùng');
    } else {
      errorPasswordInput('');
    }
    checkEnableButton();
  }

  signUp() async {
    Get.toNamed(Routes.VERIFY_OTP);
    try {
      isLockButton(true);
      if (!isLockButton.value && enableButton.value) {
      
      }
      isLockButton(false);
    } catch (e) {
      // Get.snackbar('Thông báo', 'Đăng nhập thất bại',
      //     backgroundColor: Colors.red.withOpacity(0.7),
      //     colorText: Colors.white);
      isLockButton(false);
    }
  }
}
