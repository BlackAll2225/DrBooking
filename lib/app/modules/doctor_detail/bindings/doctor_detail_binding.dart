import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailBinding extends BaseBindings {
  @override
  void injectService() {
    final parames = Get.parameters;
    String idDoctor = parames['idDoctor']?? '';
    Get.lazyPut<DoctorDetailController>(
      () => DoctorDetailController(
        idDoctor : idDoctor
      ),
    );
  }
}
