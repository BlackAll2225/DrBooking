import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/patient_detail_controller.dart';

class ProfileDetailBinding extends BaseBindings {
  @override
  void injectService() {
    final parames = Get.parameters;
    String idPatient = parames['idPatient']?? '';
    Get.lazyPut<PatientDetailController>(
      () => PatientDetailController(idPatient:idPatient),
    );
  }
}
