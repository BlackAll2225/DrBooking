import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth/auth_api.dart';
import 'package:drbooking/app/model/auth/account_session.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';
import 'package:drbooking/app/modules/personal-information/views/verify_otp_view.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationController extends BaseController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isLockUpdate = true.obs;
  final email = ''.obs;
  final error = ''.obs;
  final name = ''.obs;
  final otp = ''.obs;
  // final errorName = ''.obs;

  AuthApi authApi = AuthRemote();
  Rx<AccountSession> account = AccountSession().obs;

  final isUpdateName = false.obs;
  final isUpdatePhone = false.obs;
  TextEditingController phoneController = TextEditingController(text: '');

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  @override
  Future<void> onInit() async {
    account.value = BaseCommon.instance.accountSession!;
    phoneController.text = account.value.phoneNumber!;
    nameController.text = account.value.fullName!;
    emailController.text = account.value.email!;
    isLoading(false);
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

  void setEmailData(String value) {
    if (GetUtils.isEmail(value)) {
      email(value);
      error('');
    } else {
      error('Sai định dạng email vd: abc@gmail.com');
    }
  }

  void setNameData(String value) {
    name(value);
  }

  bool validation() {
    if (name.value.isEmpty || error.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  fetchDataPersonal() async {
    isLoading(true);
    // await authApi
    //     .getPersonal(idClient: BaseCommon.instance.accountSession!.clientId)
    //     .then((value) {
    //   account.value = value;
    // }).catchError((error) {
    //   isLoading(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
    // isLoading(false);
  }

  onTapEdit() {
    isLockUpdate(false);
  }

  Future pickImageFromCategory() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      await AuthRemote()
          .updateAvatarClientProfile(stringPathImage: returnImage.path)
          .then((jwt) async {
        await BaseCommon.instance.saveToken(jwt);
        await BaseCommon.instance.decodeJWT();
        account.value = BaseCommon.instance.accountSession!;
        UtilCommon.snackBar(text: 'Cập nhật thành công');
      });
    }
  }

  revertName() {
    isUpdateName.value = false;
    nameController.text = account.value.fullName!;
  }

  updateName() async {
    isUpdateName.value = false;
    AuthRemote().updateNameAccount(name: nameController.text).then((jwt) async {
      await BaseCommon.instance.saveToken(jwt);
      await BaseCommon.instance.decodeJWT();
      account.value = BaseCommon.instance.accountSession!;
      UtilCommon.snackBar(text: 'Cập nhật thành công');
    }).catchError(handleError);
  }

  revertPhone() {
    isUpdatePhone.value = false;
    phoneController.text = account.value.phoneNumber!;
  }

  changePhone(String code) {
    AuthRemote()
        .changePhone(otp: code, phone: phoneController.text)
        .then((jwt) async {
      Get.until((route) => Get.currentRoute == Routes.HOME);
      await BaseCommon.instance.saveToken(jwt);
      await BaseCommon.instance.decodeJWT();
      account.value = BaseCommon.instance.accountSession!;
      UtilCommon.snackBar(text: 'Cập nhật thành công');
    }).catchError(handleError);
  }

  sendMailChangePhone() async {
    AuthRemote().sendEmailOTPChangePhone().then((value) {
      Get.to(VerifyOtpPhoneChangeView());
    }).catchError(handleError);
  }
}
