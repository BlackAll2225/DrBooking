import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/model/nav_account.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabAccountController extends BaseController {
  //TODO: Implement TabAccountController

  final count = 0.obs;
  List<NavAccount> listNav = [
    NavAccount(title: 'Thông tin tài khoản', icon: Icon(Icons.person), path: Routes.PERSONAL_INFORMATION, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Lịch sử', icon: Icon(Icons.history), path: '', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi mật khẩu', icon: Icon(Icons.password), path: Routes.CHANGE_PASSWORD, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Các chi nhánh', icon: Icon(Icons.location_city_outlined), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Trung tâm trợ giúp', icon: Icon(Icons.phone), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Thông tin chung', icon: Icon(Icons.info), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)


  ];
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

  void increment() => count.value++;
}
