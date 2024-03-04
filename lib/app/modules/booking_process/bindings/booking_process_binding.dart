import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_controller.dart';

class BookingProcessBinding extends BaseBindings {
  @override
  void injectService() {
    bool isChoiceSpecial = Get.arguments as bool;
    Get.lazyPut<BookingProcessController>(
      () => BookingProcessController(isSpecialChoice:isChoiceSpecial),
    );
  }
}
