import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/welcome_board_controller.dart';

class WelcomeBoardBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<WelcomeBoardController>(
      () => WelcomeBoardController(),
    );
  }
}
