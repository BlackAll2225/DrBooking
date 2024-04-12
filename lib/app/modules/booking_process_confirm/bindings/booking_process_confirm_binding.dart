import 'dart:developer';

import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_confirm_controller.dart';

class BookingProcessConfirmBinding extends BaseBindings {
  @override
  void injectService() {
    RequestParamBooking requestParam = Get.arguments as RequestParamBooking;
    log("messag2222e");
    Get.lazyPut<BookingProcessConfirmController>(
      () => BookingProcessConfirmController(requestParam:requestParam),
    );
  }
}
