import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/new_profile_controller.dart';

class NewProfileBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<NewProfileController>(
      () => NewProfileController(),
    );
  }
}
