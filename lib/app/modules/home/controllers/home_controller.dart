import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/modules/tab-profile/views/tab_profile_view.dart';
import 'package:drbooking/app/modules/tab_account/controllers/tab_account_controller.dart';
import 'package:drbooking/app/modules/tab_account/views/tab_account_view.dart';
import 'package:drbooking/app/modules/tab_calendar/controllers/tab_calendar_controller.dart';
import 'package:drbooking/app/modules/tab_calendar/views/tab_calendar_view.dart';
import 'package:drbooking/app/modules/tab_history/controllers/tab_history_controller.dart';
import 'package:drbooking/app/modules/tab_history/views/tab_history_view.dart';
import 'package:drbooking/app/modules/tab_home_view/controllers/tab_home_view_controller.dart';
import 'package:drbooking/app/modules/tab_home_view/views/tab_home_view_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  //TODO: Implement HomeController
  RxList<Widget> body = RxList([
    TabHomeView(),
    TabCalendarView(),
    SizedBox(),
    TabProfileView(),
    TabAccountView()
  ]);
  final indexSelected = 0.obs;
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

  onTapped(int index) async {
    switch (index) {
      case 0:
        Get.find<TabHomeViewController>();
        indexSelected(0);
        break;
      case 1:
        Get.find<TabCalendarController>();
        indexSelected(1);
        break;
      case 2:
        break;
      case 3:
        Get.find<TabHistoryController>();
        indexSelected(3);
        break;
      case 4:
        Get.find<TabAccountController>();
        indexSelected(4);
        break;
      default:
    }
  }
}
