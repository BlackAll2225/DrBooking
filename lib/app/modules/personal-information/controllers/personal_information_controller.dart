import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth_api.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalInformationController extends BaseController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isLockUpdate = true.obs;
  final email = ''.obs;
  final error = ''.obs;
  final name = ''.obs;
  // final errorName = ''.obs;

  AuthApi authApi = AuthRemote();
  Rx<PersonalAccount> account = PersonalAccount.emptyObject().obs;

  @override
  Future<void> onInit() async {
    await fetchDataPersonal();
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
    await authApi
        .getPersonal(idClient: BaseCommon.instance.accountSession!.clientId)
        .then((value) {
      account.value = value;
    }).catchError((error) {
      isLoading(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
    isLoading(false);
  }

  onTapEdit(){
    isLockUpdate(false);
  }
}
