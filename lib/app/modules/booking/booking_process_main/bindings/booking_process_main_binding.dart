import 'dart:convert';

import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_main_controller.dart';

class BookingProcessMainBinding extends BaseBindings {
  @override
  void injectService() {
         RequestParamBooking requestParamBooking =
       Get.arguments as RequestParamBooking;
    Get.lazyPut<BookingProcessMainController>(
      () => BookingProcessMainController(
          requestParamBooking: requestParamBooking,),
    );
  }
}
