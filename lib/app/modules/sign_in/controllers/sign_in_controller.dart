import 'package:drbooking/app/base/base_controller.dart';
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
    try {
      if (!isLockButton.value && enableButton.value) {
      isLockButton(true);

        // UserModel userLogin = await UserApi.login(
        //     phone.value, passowrd.value, deviceToken.toString());

        // Get.find<StartAppController>().accessToken = userLogin.userToken!;
        // Get.find<StartAppController>().name.value = userLogin.userFullName!;
        // Get.find<StartAppController>().numberPhone.value = userLogin.userPhone!;
        // Get.find<StartAppController>().email(userLogin.userEmail ?? "");

        // String refeshToken = userLogin.refreshToken ?? "";
        // log("Login: $refeshToken");
        // await DatabaseLocal.instance.saveRefeshToken(refeshToken);
        // Get.snackbar('Thông báo', 'Đăng nhập thành công',
        //     backgroundColor: Colors.green.withOpacity(0.7),
        //     colorText: Colors.white);
        // if (userLogin.userFullName!.trim().isEmpty) {
        //   Get.offAllNamed(Routes.UPDATE_FIRSTTIME);
        // } else {
        Get.offAllNamed(Routes.HOME);
        // }
      }
      isLockButton(false);
    } catch (e) {
      Get.snackbar('Thông báo', 'Đăng nhập thất bại',
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: Colors.white);
      isLockButton(false);
    }
  }
}
