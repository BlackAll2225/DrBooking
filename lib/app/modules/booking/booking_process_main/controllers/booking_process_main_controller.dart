import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/request_body_create_booking.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/modules/doctor/views/doctor_view.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingProcessMainController extends BaseController {
  //TODO: Implement BookingProcessController
  BookingProcessMainController({required this.requestParamBooking});
  final RequestParamBooking requestParamBooking;
  DoctorApi doctorApi = DoctorRemote();

  RxList<Clinic> listClinic = <Clinic>[].obs;
  Rx<Clinic> selectedClinic =
      Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh').obs;

  RxList<Specialty> listSpecialty = <Specialty>[].obs;
  Rx<Specialty> selectedSpecialty =
      Specialty(name: 'Vui lòng chọn chuyên khoa').obs;

  RxList<DoctorPreview> listDoctors = <DoctorPreview>[].obs;
  Rx<DoctorPreview> selectedDoctor = DoctorPreview().obs;

  Rx<RequestParamBooking> requestData = RequestParamBooking().obs;

  Rx<DateTime> selectedDate = DateTime.now().add(Duration(days: 3)).obs;
  Rx<DutySchedule> selectedSlot = DutySchedule.emtyObject().obs;
  final concatSlotTime = 'Xin mời chọn thời gian'.obs;

  BookingApi bookingApi = BookingRemote();
  TextEditingController searchController = TextEditingController(text: '');
  TextEditingController symptomController = TextEditingController(text: '');

  @override
  Future<void> onInit() async {
    requestData.value = requestParamBooking;
    selectedClinic.value = requestParamBooking.clinic ??
        Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh');
    selectedSpecialty.value =
        Specialty(name: 'Vui lòng chọn chuyên khoa');
    await fetchDataClinic();
    // await fetchDataSpecialtys(idClinic: requestParamBooking.clinic!.id);
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

  onTapNextButton() {
    requestParamBooking.dateBooking =
        DateFormat('yyyy-MM-dd').format(selectedDate.value);
    requestParamBooking.dutySchedule = selectedSlot.value;
    requestParamBooking.specialty = selectedSpecialty.value;
    requestParamBooking.doctor = selectedDoctor.value;
    requestParamBooking.symptom = symptomController.text;
    Get.toNamed(Routes.BOOKING_PROCESS_CONFIRM, arguments: requestParamBooking);
  }

  fetchDataClinic() async {
    isLoading(true);
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) {
      listClinic.value = value;
    }).catchError((error) {
      isLoading(false);
      log("err" + error.toString());
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
    isLoading(false);
  }

  fetchDataSpecialtys({required String idClinic}) async {
    isFetchMore(true);
    await doctorApi
        .getListSpecialtyByIdClinic(
            idClinic: idClinic, searchName: searchController.text)
        .then((value) {
      listSpecialty.value = value;
      isFetchMore(false);
      isLoading(false);
    }).catchError(handleError);
  }

  onTapCardDoctor(DoctorPreview doctor) {
    selectedDoctor.value = doctor;
    requestParamBooking.doctor = doctor;
  }

  fetchDataDoctor(
      {required String idClinic, required String idSpecicalty}) async {
    await doctorApi
        .getListDoctorBySpecialAndClinic(
            idClinic: idClinic, idSpecialty: idSpecicalty)
        .then((value) {
      listDoctors.value = value;
    });
  }

  setTimeSlotChoice(DateTime dateSelected, DutySchedule slot) async {
    log(slot.toJson().toString());

    selectedDate.value = dateSelected;
    selectedSlot.value = slot;
    concatSlotTime.value =
        '${UtilCommon.convertEEEDateTime(dateSelected)} | ${listTime[slot.slotNumber - 1]}';
    log(concatSlotTime.value);
  }

  onTapClinic(Clinic clinic) async {
    selectedSpecialty.value = Specialty(name: 'Vui lòng chọn chuyên khoa');
    selectedDoctor.value = DoctorPreview();
    selectedSlot.value = DutySchedule.emtyObject();
    selectedClinic.value = clinic;
    requestParamBooking.clinic = clinic;
  }

  showBottomBranch() async {
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

  onTapSpecial(Specialty specialty) async {
    selectedDoctor.value = DoctorPreview();
    selectedSlot.value = DutySchedule.emtyObject();
    concatSlotTime.value = 'Mời chọn thời gian';

    selectedSpecialty.value = specialty;
    requestParamBooking.specialty = specialty;
  }

  onTapCalendar() async {}

  checkTimeService(DateTime dateSelected) async {
    selectedDate.value = dateSelected;
    // await bookingApi
    //     .checkDutyScheduleSpecialty()
    //     .then((value) {})
    //     .catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }

  onTapTimeWidget() {
    Get.toNamed(Routes.BOOKING_PROCESS_TIME,
        arguments: requestParamBooking.dataButton!.type);
  }

  createBooking() {
    BodyRequestCreateBooking body = BodyRequestCreateBooking();
    body.clinicId = requestParamBooking.clinic?.id;
    body.medicalServiceId = requestParamBooking.specialty?.id;
    body.medicalServiceId = null;
    body.patientProfileId = requestParamBooking.patient?.patientId;
    body.symptoms = '';
    body.dutyScheduleId = selectedSlot.value.dutyScheduleId;
  }

  onTapChoiceDoctor() async {
    await fetchDataDoctor(
        idClinic: requestParamBooking.clinic!.id,
        idSpecicalty: requestParamBooking.specialty!.id!);
    Get.to(() => DoctorView(), transition: Transition.downToUp);
  }

  // onTapNextButton() {
  //   requestParamBooking.symptom = symptomController.text;
  //   Get.toNamed(Routes.BOOKING_PROCESS_CONFIRM, arguments: requestParamBooking);
  // }
}
