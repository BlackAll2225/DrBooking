import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_service_controller.dart';

class BookingProcessServiceBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingProcessServiceController>(
      () => BookingProcessServiceController(),
    );
  }
}
