import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_medical_serivce_controller.dart';

class BookingMedicalSerivceBinding extends BaseBindings {
  @override
  void injectService() {
    RequestParamBooking requestParamBooking = Get.arguments as RequestParamBooking;
    Get.lazyPut<BookingMedicalSerivceController>(
      () => BookingMedicalSerivceController(requestParamBooking: requestParamBooking),
    );
  }
}
