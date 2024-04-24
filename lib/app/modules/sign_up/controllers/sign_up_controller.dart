import 'dart:async';
import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/auth_local.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth/auth_api.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/register_payload.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

  RxBool checkpassword = true.obs;
  RxBool enableButton = false.obs;

  RxString errorNameInput = "".obs;
  RxString errorPhoneInput = "".obs;
  RxString errorPasswordInput = "".obs;
  RxString errorEmail = "".obs;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController rePasswordTextController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: '');

  String? deviceToken;

  AuthApi authApi = BaseCommon.instance.mode == LOCAL_MODE ? AuthLocal() :AuthRemote() ; 
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

  validateName() {
    if (nameTextController.text.trim().isEmpty) {
      return errorNameInput('Họ và tên không được để trống');
    } else {
      errorNameInput("");
    }
    checkEnableButton();
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
        errorNameInput.isEmpty &&
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
      if (!isLockButton.value && enableButton.value) {
        isLockButton.value = true;
        RegisterPayload registerPayload = RegisterPayload(
          email: emailController.text,
          phoneNumber: phoneTextController.text,
          password: passwordTextController.text,
          fullName: nameTextController.text
        );
       await authApi.register(payload: registerPayload).then((value){
          UtilCommon.snackBar(text: 'Đăng kí thành công');
          Get.offAllNamed(Routes.SIGN_IN);
       }).catchError(handleError);
      }
  }
}
