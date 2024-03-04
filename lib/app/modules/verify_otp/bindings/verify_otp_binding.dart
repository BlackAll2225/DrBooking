import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<VerifyOtpController>(
      () => VerifyOtpController(),
    );
  }
}
