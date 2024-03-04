import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/booking_process_branch_controller.dart';

class BookingProcessBranchBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<BookingProcessBranchController>(
      () => BookingProcessBranchController(),
    );
  }
}
