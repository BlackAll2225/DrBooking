import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingGeneralController extends BaseController {
  //TODO: Implement BookingGeneralController
  BookingGeneralController({required this.requestParamBooking});
  RequestParamBooking requestParamBooking;
  Rx<Clinic> selectedClinic =
      Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh').obs;
  RxList<Clinic> listClinic = <Clinic>[].obs;

  DoctorApi doctorApi = DoctorRemote();
  BookingApi bookingApi = BookingRemote();

  Rx<DateTime> selectedDate = DateTime.now().add(Duration(days: 3)).obs;
  Rx<DutySchedule> selectedSlot = DutySchedule.emtyObject().obs;
  final concatSlotTime = 'Xin mời chọn thời gian'.obs;
  TextEditingController symptomController = TextEditingController(text: '');


  @override
  void onInit() {
    selectedClinic.value = requestParamBooking.clinic ??
        Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh');

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

  setTimeSlotChoice(DateTime dateSelected, DutySchedule slot) async {

    selectedDate.value = dateSelected;
    selectedSlot.value = slot;
    concatSlotTime.value =
        '${UtilCommon.convertEEEDateTime(dateSelected)} | ${listTime[slot.slotNumber-1]}';
        log(concatSlotTime.value);
  }

  fetchDataClinic() async {
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) {
      listClinic.value = value;
    });
  }

  onTapClinic(Clinic clinic) async {
    selectedSlot.value = DutySchedule.emtyObject();
    selectedClinic.value = clinic;
    requestParamBooking.clinic = clinic;
  }

  onTapTimeWidget() {
    Get.toNamed(Routes.BOOKING_PROCESS_TIME,
        arguments: requestParamBooking.dataButton!.type);
  }

  showBottomBranch() async {
    await fetchDataClinic();
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
            topRight: Radius.circular(UtilsReponsive.height(10, Get.context!)),
          )),
      padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
      constraints:
          BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
      child: Column(
        children: [
          TextConstant.subTile1(Get.context!, text: 'Chi nhánh'),
          Expanded(
              child: ListView.builder(
            itemCount: listClinic.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                onTapClinic(listClinic[index]);
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile2(context,
                          text: listClinic[index].name),
                      listClinic[index].id == selectedClinic.value.id
                          ? const Icon(Icons.check)
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }

onTapNextButton() {
    requestParamBooking.dateBooking =
        DateFormat('yyyy-MM-dd').format(selectedDate.value);
    requestParamBooking.dutySchedule = selectedSlot.value;
    requestParamBooking.symptom = symptomController.text;
    Get.toNamed(Routes.BOOKING_PROCESS_CONFIRM, arguments: requestParamBooking);
  }
}
