import 'package:get/get.dart';

import '../controllers/check_permission_controller.dart';

class CheckPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckPermissionController>(
      () => CheckPermissionController(),
    );
  }
}
