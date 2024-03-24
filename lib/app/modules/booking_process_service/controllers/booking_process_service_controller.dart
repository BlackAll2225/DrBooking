import 'dart:convert';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BookingProcessServiceController extends BaseController {
  //TODO: Implement BookingProcessServiceController
  BookingProcessServiceController({required this.requestParamBooking});
  final RequestParamBooking requestParamBooking;

  List<ButtonService> listService = [
    ButtonService(content: "Khám tổng quát", imageUrl: ImageAssets.iconGeneralCheck, isService: false, type: TypeService.generalExam),
    ButtonService(content: "Khám Chuyên Khoa", imageUrl: ImageAssets.iconSpecialCheck, isService: true,type: TypeService.specialtyExam),
    ButtonService(content: "Xét nghiệm", imageUrl: ImageAssets.iconLabCheck, isService: false,type: TypeService.labExam),
    ButtonService(content: "Tiêm chủng", imageUrl: ImageAssets.iconLabCheck, isService: true, type: TypeService.requestExam),


  ];
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

  onTapService(ButtonService buttonService){
    requestParamBooking.dataButton = buttonService;
    Get.toNamed(Routes.BOOKING_PROCESS, arguments: requestParamBooking);
  }

}
