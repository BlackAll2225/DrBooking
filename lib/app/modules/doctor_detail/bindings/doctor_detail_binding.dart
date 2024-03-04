import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<DoctorDetailController>(
      () => DoctorDetailController(),
    );
  }
}
