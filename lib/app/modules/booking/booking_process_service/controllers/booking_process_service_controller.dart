import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BookingProcessServiceController extends BaseController {
  //TODO: Implement BookingProcessServiceController
  BookingProcessServiceController({required this.requestParamBooking});
  final RequestParamBooking requestParamBooking;

  List<ButtonService> listService = [
    ButtonService(content: "Khám tổng quát",path: Routes.BOOKING_GENERAL, imageUrl: ImageAssets.iconGeneralCheck, isService: false, type: TypeService.generalExam, appointmentType: appointmentTypeList.last),
    ButtonService(content: "Khám Chuyên Khoa",path: Routes.BOOKING_PROCESS_MAIN, imageUrl: ImageAssets.iconSpecialCheck, isService: true,type: TypeService.specialtyExam, appointmentType: appointmentTypeList[2]),
    ButtonService(content: "Xét nghiệm",path: Routes.BOOKING_MEDICAL_SERIVCE, imageUrl: ImageAssets.iconLabCheck, isService: false,type: TypeService.labExam, appointmentType: appointmentTypeList[0]),
    ButtonService(content: "Tiêm chủng",path: Routes.BOOKING_MEDICAL_SERIVCE, imageUrl: ImageAssets.iconLabCheck, isService: true, type: TypeService.vaccination, appointmentType: appointmentTypeList[5]),
    ButtonService(content: "Tâm lý",path: Routes.BOOKING_MEDICAL_SERIVCE, imageUrl: ImageAssets.iconLabCheck, isService: true, type: TypeService.psychological, appointmentType: appointmentTypeList[4]),

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
    log(requestParamBooking.toString());
    requestParamBooking.dataButton = buttonService;
    Get.toNamed(buttonService.path, arguments: requestParamBooking);
  }

}
