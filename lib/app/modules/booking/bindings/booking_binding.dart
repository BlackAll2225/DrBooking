import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
  }
}
