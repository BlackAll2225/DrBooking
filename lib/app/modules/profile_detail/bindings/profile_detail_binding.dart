import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/profile_detail_controller.dart';

class ProfileDetailBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<ProfileDetailController>(
      () => ProfileDetailController(),
    );
  }
}
