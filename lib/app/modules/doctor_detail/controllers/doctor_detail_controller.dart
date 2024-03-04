import 'package:drbooking/app/base/base_controller.dart';
import 'package:get/get.dart';

class DoctorDetailController extends BaseController {
  //TODO: Implement DoctorDetailController

  final count = 0.obs;
  final isFeedback =false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 updateTabFeedBack(bool value){
  isFeedback.value = value;
 }
}
