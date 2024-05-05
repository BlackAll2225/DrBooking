import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_general_controller.dart';

class BookingGeneralBinding extends Bindings {
  @override
  void dependencies() {
    RequestParamBooking requestParamBooking = Get.arguments as RequestParamBooking;
    Get.lazyPut<BookingGeneralController>(
      () => BookingGeneralController(requestParamBooking: requestParamBooking),
    );
  }
}
