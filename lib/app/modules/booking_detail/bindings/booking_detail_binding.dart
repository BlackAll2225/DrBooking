import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailBinding extends BaseBindings {
  @override
  void injectService() {
    String idAppointment = Get.arguments as String;
    // Map<String,String?> param = Get.parameters;
    Get.lazyPut<BookingDetailController>(
      () => BookingDetailController(idAppointment:idAppointment,),
    );
  }
}
