import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/local/doctor_local.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/button_feature.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class TabHomeViewController extends BaseController {
  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;

  final count = 0.obs;
  RxList<Doctor> listDoctorPreview = <Doctor>[].obs;
  RxList<BookingPreview> listBookingPreview = <BookingPreview>[].obs;
  final List<ButtonFeature> listButton = [
    ButtonFeature(title: "Đặt lịch", colorBackground: Colors.redAccent, colorText: Colors.black, icon: Icon(Icons.add,color: Colors.white,), path: '')
    ,ButtonFeature(title: "Chi nhánh", colorBackground: ColorsManager.primary, colorText: Colors.black, icon: Icon(Icons.map,color: Colors.white,), path: Routes.MAP_EXPLORE)
    ,ButtonFeature(title: "Lịch sử", colorBackground: Colors.brown, colorText: Colors.black, icon: Icon(Icons.history, color:Colors.white,), path: '')
    ,ButtonFeature(title: "Bệnh án", colorBackground: Colors.green, colorText: Colors.black, icon: Icon(LineIcons.bookReader, color:Colors.white), path: Routes.MEDICAL_RECORD)
  ];

  late DoctorApi doctorApi = BaseCommon.instance.mode == LOCAL_MODE ? DoctorLocal(): DoctorRemote();
  late BookingApi bookingApi =  BookingLocal();
  final isFetch2 = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await initalData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initalData() async {
    try {
       getListDoctorRandom();
       getListNewestBooking();
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  getListDoctorRandom() async {
    isLoading.value = true;
    listDoctorPreview.value = await doctorApi.getListDoctorRandom(param: "clinic-khaihoang");
    isLoading.value = false;
  }

  getListNewestBooking() async {
    isFetch2.value = true;
    listBookingPreview.value =  await bookingApi.getListBookingNewest();
    isFetch2.value = false;
    
  }
  opTapCardDoctor({required String idDoctor}){
    Get.toNamed(Routes.DOCTOR_DETAIL, parameters: {
      "idDoctor": idDoctor
    });
  }
}
