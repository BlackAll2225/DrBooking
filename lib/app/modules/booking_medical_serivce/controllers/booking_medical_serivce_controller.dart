import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/modules/booking_process_time/controllers/booking_process_time_controller.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const lab_title = 'Xét nghiệm';
const vacin_title = 'Tiêm chủng';
const psychological_title = 'Tâm lý';

const lab_service = 'Loại xét nghiệm';
const vacin_service = 'Loại vacin';
const psychological_service = 'Chuyên đề';

class BookingMedicalSerivceController extends BaseController {
  //TODO: Implement BookingMedicalSerivceController
  BookingMedicalSerivceController({required this.requestParamBooking});
  RequestParamBooking requestParamBooking;
  final title = ''.obs;
  final titleService = ''.obs;
  Rx<Clinic> selectedClinic =
      Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh').obs;
  RxList<Clinic> listClinic = <Clinic>[].obs;
  RxList<MedicalService> listService = <MedicalService>[].obs;


  DoctorApi doctorApi = DoctorRemote();
  BookingApi bookingApi = BookingRemote();

  Rx<MedicalService> selectedMedicalService =  MedicalService(medicalSpecialtyName: '', medicalServiceName: 'Vui lòng chọn dịch vụ').obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DutySchedule> selectedSlot = DutySchedule.emtyObject().obs;
  final concatSlotTime = 'Xin mời chọn thời gian'.obs;

  @override
  void onInit() {
    selectedClinic.value = requestParamBooking.clinic ??
        Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh');
    getTitle(requestParamBooking.dataButton!.type);
    getServiceTitle(requestParamBooking.dataButton!.type);

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

  getTitle(TypeService type) {
    switch (type) {
      case TypeService.labExam:
        title(lab_title);
        break;
      case TypeService.vaccination:
        title(vacin_title);
        break;
      case TypeService.psychological:
        title(psychological_title);
        break;
      default:
    }
  }

  getServiceTitle(TypeService type) {
    switch (type) {
      case TypeService.labExam:
        titleService(lab_service);
        break;
      case TypeService.vaccination:
        titleService(vacin_service);
        break;
      case TypeService.psychological:
        titleService(psychological_service);
        break;
      default:
    }
  }

  getDataService(TypeService type) async {
    switch (type) {
      case TypeService.labExam:
        await doctorApi
            .getListMedicalServiceLab()
            .then((value) {
              listService.value = value;
            })
            .catchError((error) {
          log("err:$error");
          isLockButton(false);
          UtilCommon.snackBar(text: '${error.message}');
        });
        break;
      case TypeService.vaccination:
        await doctorApi
            .getListMedicalServiceVacin()
            .then((value) {
                  listService.value = value;
            })
            .catchError((error) {
          log("err:$error");
          isLockButton(false);
          UtilCommon.snackBar(text: '${error.message}');
        });
        break;
      case TypeService.psychological:
        await doctorApi
            .getListMedicalServicePys()
            .then((value) {
                  listService.value = value;
            })
            .catchError((error) {
          log("err:$error");
          isLockButton(false);
          UtilCommon.snackBar(text: '${error.message}');
        });
        break;
      default:
    }
  }

  fetchDataClinic() async {
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) {
      listClinic.value = value;
    });
  }

  onTapClinic(Clinic clinic) async {
    selectedClinic.value = clinic;
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
onTapMedicalService(MedicalService service){
  selectedMedicalService.value = service;
}
  showBottomSpecial() async {
    await getDataService(requestParamBooking.dataButton!.type);
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
            itemCount: listService.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                onTapMedicalService(listService[index]);
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextConstant.subTile2(context,
                            text: listService[index].medicalServiceName),
                      ),
                      listService[index].medicalServiceName == selectedMedicalService.value.medicalServiceName
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
    ///Show list
  }

  checkTimeService(DateTime dateSelected) async {
    selectedDate.value = dateSelected;
    // await bookingApi
    //     .checkDutyScheduleMedicalService()
    //     .then((value) {})
    //     .catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }
    onTapTimeWidget() {
    log("message" + requestParamBooking.dataButton!.type.toString());
    Get.toNamed(Routes.BOOKING_PROCESS_TIME,
        arguments: requestParamBooking.dataButton!.type);
  }
  setTimeSlotChoice(DateTime dateSelected, DutySchedule slot) async {
    log(slot.toJson().toString());

    selectedDate.value = dateSelected;
    selectedSlot.value = slot;
    concatSlotTime.value =
        '${UtilCommon.convertEEEDateTime(dateSelected)} | ${listTime[slot.slotNumber-1]}';
        log(concatSlotTime.value);
  }
}
