import 'dart:developer';

import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_clinic_controller.dart';

class BookingProcessClinicBinding extends BaseBindings {
  @override
  void injectService() {
    log("message Binding");
   RequestParamBooking requestParamBooking =  Get.arguments as RequestParamBooking;
    Get.lazyPut<BookingProcessClinicController>(
      () => BookingProcessClinicController(requestParamBooking: requestParamBooking),
    );
  }
}
