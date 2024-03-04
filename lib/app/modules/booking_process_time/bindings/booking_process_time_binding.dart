import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_time_controller.dart';

class BookingProcessTimeBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingProcessTimeController>(
      () => BookingProcessTimeController(),
    );
  }
}
