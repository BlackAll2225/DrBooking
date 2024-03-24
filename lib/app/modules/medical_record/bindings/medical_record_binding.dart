import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/medical_record_controller.dart';

class MedicalRecordBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<MedicalRecordController>(
      () => MedicalRecordController(),
    );
  }
}
