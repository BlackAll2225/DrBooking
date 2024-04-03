import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_time_controller.dart';

class BookingProcessTimeBinding extends BaseBindings {
  @override
  void injectService() {
    TypeService type = Get.arguments as TypeService;
    Get.lazyPut<BookingProcessTimeController>(
      () => BookingProcessTimeController(type: type),
    );
  }
}
