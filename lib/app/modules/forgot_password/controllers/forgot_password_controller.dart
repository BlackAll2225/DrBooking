import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/modules/forgot_password/views/verify_otp_view.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  final count = 0.obs;
  TextEditingController emailController = TextEditingController(text: '');
  RxString errorEmail = "".obs;
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  final errorPassword = ''.obs;
  final errorOldPassword = ''.obs;
  final otp = ''.obs;

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

  validateEmail() {
    if (emailController.text.trim().isEmpty) {
      isEnableButton.value = false;
      return errorEmail('Email không được để trống');
    } else if (!emailController.text.isEmail) {
      isEnableButton.value = false;
      return errorEmail('Email không đúng chuẩn abc@gmail.com');
    }
    isEnableButton.value = true;
    return errorEmail('');
  }

  sendOTP() async {
    if (isEnableButton.value &&  validate()) {
      AuthRemote().sendEmailOTP(email: emailController.text).then((value) {
        Get.to(() => const VerifyOtpFogotView());
      }).catchError(handleError);
    }else{
      log('message ${validate()}');
    }
  }

  bool validate() {
    if (newPasswordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      UtilCommon.snackBar(text: 'Vui lòng nhập đủ thông tin', isFail: true);
      return false;
    }
    if (newPasswordController.text != rePasswordController.text) {
      errorPassword('Nhập lại mật khẩu mới không khớp');
      return false;
    }
    errorPassword('');
    if (newPasswordController.text.length < 6) {
      errorPassword('Độ dài mật khẩu tối thiểu 6 kí tự');
      return false;
    }
    errorPassword('');
    return true;
  }

  changePassword(String verificationCode) async {
    if (validate()) {
      await AuthRemote()
          .changePassForgot(
              email: emailController.text,
              password: newPasswordController.text,
              otp: verificationCode)
          .then((value) {
          Get.offAllNamed(Routes.SIGN_IN);
          UtilCommon.snackBar(text: 'Cập nhật thành công');
      }).catchError(handleError);
    }
  }
}
