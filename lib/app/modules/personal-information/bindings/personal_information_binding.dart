import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/personal_information_controller.dart';

class PersonalInformationBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<PersonalInformationController>(
      () => PersonalInformationController(),
    );
  }
}
