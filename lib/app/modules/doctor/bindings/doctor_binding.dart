import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';

class DoctorBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<DoctorController>(
      () => DoctorController(),
    );
  }
}
