import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
