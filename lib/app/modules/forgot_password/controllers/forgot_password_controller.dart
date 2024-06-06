import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/modules/forgot_password/views/verify_otp_view.dart';
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
    if (isEnableButton.value) {
      AuthRemote().sendEmailOTP(email: emailController.text).then((value) {
      Get.to(() =>const VerifyOtpFogotView());
      }).catchError(handleError);
    }
  }
  // changePassword() async {
  //   if (validate()) {
  //     await AuthRemote()
  //         .changePassword(
  //             currentPassword: oldPasswordController.text,
  //             newPassword: newPasswordController.text)
  //         .then((value) {
  //       if (value) {
  //         Get.back();
  //         UtilCommon.snackBar(text: 'Cập nhật thành công');
  //       }
  //     }).catchError(handleError);
  //   }
  // }
  changePassword(){}
}
