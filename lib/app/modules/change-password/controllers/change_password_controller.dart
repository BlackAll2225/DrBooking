import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/resources/util_notify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends BaseController {
  //TODO: Implement ChangePasswordController

  final count = 0.obs;
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  final errorPassword = ''.obs;
    final errorOldPassword= ''.obs;
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

  bool validate(){
    if(oldPasswordController.text.isEmpty||newPasswordController.text.isEmpty||rePasswordController.text.isEmpty){
     UtilNoti.snackFail(text: 'Vui lòng nhập đủ thông tin',isFail: true);
      return false;
    }
     if(newPasswordController.text!=rePasswordController.text){
       errorPassword('Nhập lại mật khẩu mới không khớp');
      return false;
    }
    errorPassword('');
    if(oldPasswordController.text.length<6)
    {
      errorOldPassword('Độ dài mật khẩu tối thiểu 6 kí tự');
      return false;
    }
    errorOldPassword('');
    if(newPasswordController.text.length<6){
      errorOldPassword('Độ dài mật khẩu tối thiểu 6 kí tự');
      return false;
    }
    errorOldPassword('');
    errorPassword('');
      return true;
  }

  changePassword()async {
    if(validate()){
     Get.back();
          UtilNoti.snackFail(text: 'Cập nhật thành công');
    }
  }
}
