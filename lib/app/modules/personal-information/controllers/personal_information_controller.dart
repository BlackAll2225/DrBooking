import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalInformationController extends BaseController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isLoading = true.obs;
  final email = ''.obs;
  final error = ''.obs;
  final name = ''.obs;
  // final errorName = ''.obs;

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

  
}
