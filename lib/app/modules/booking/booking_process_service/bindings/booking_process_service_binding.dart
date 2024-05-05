import 'dart:developer';

import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_service_controller.dart';

class BookingProcessServiceBinding extends BaseBindings {
  @override
  void injectService() {
   RequestParamBooking requestParamBooking =  Get.arguments as RequestParamBooking;
   log(requestParamBooking.clinic!.fullAddress.toString());
    Get.lazyPut<BookingProcessServiceController>(
      () => BookingProcessServiceController(requestParamBooking:requestParamBooking),
    );
  }
}
