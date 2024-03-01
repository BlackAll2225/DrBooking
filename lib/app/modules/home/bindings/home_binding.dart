import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends BaseBindings {

  @override
  void injectService() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
