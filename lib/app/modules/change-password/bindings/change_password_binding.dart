import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
  }
}
