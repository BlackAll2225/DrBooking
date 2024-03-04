import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_confirm_controller.dart';

class BookingProcessConfirmBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingProcessConfirmController>(
      () => BookingProcessConfirmController(),
    );
  }
}
