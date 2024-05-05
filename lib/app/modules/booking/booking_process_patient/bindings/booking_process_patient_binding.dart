import 'package:drbooking/app/base/base_bindings.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_patient_controller.dart';

class BookingProcessPatientBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingProcessPatientController>(
      () => BookingProcessPatientController(),
    );
  }
}
