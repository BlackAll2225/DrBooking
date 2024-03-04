import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/modules/tab-profile/controllers/tab_profile_controller.dart';
import 'package:drbooking/app/modules/tab_account/controllers/tab_account_controller.dart';
import 'package:drbooking/app/modules/tab_calendar/controllers/tab_calendar_controller.dart';
import 'package:drbooking/app/modules/tab_history/controllers/tab_history_controller.dart';
import 'package:drbooking/app/modules/tab_home_view/controllers/tab_home_view_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends BaseBindings {

  @override
  void injectService() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TabAccountController>(
      () => TabAccountController(),
    );
      Get.lazyPut<TabCalendarController>(
      () => TabCalendarController(),
    );
     Get.lazyPut<TabHistoryController>(
      () => TabHistoryController(),
    );
     Get.lazyPut<TabHomeViewController>(
      () => TabHomeViewController(),
    );
     Get.lazyPut<TabProfileController>(
      () => TabProfileController(),
    );
  }
}
