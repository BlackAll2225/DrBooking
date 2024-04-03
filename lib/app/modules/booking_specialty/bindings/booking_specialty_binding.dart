import 'package:get/get.dart';

import '../controllers/booking_specialty_controller.dart';

class BookingSpecialtyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingSpecialtyController>(
      () => BookingSpecialtyController(),
    );
  }
}
