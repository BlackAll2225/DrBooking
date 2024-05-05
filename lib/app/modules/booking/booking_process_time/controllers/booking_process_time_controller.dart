import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_check_duty_schedule.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/modules/booking/booking_general/controllers/booking_general_controller.dart';
import 'package:drbooking/app/modules/booking/booking_medical_serivce/controllers/booking_medical_serivce_controller.dart';
import 'package:drbooking/app/modules/booking/booking_process_main/controllers/booking_process_main_controller.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingProcessTimeController extends BaseController {
  //TODO: Implement BookingProcessTimeController

  BookingProcessTimeController({required this.type});
  TypeService type;
  Rx<DateTime> selectedDate = DateTime.now().add(Duration(days: 3)).obs;
  Rx<DutySchedule> selectedSlot = DutySchedule.emtyObject().obs;
  RxList<DutySchedule> listDutySchedule = <DutySchedule>[].obs;
  List<String> listSlot = listTime;
  @override
  Future<void> onInit() async {
    isLoading(true);
    await getTimeSelectedInit(type);
    isLoading(false);
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

  getTimeSelectedInit(TypeService type) async {
    switch (type) {
      case TypeService.generalExam:
        selectedDate.value =
            Get.find<BookingGeneralController>().selectedDate.value;
        selectedSlot.value =
            Get.find<BookingGeneralController>().selectedSlot.value;
        await checkTimeGeneral(selectedDate.value,
            Get.find<BookingGeneralController>().requestParamBooking);
        break;
      case TypeService.specialtyExam:
        selectedDate.value =
            Get.find<BookingProcessMainController>().selectedDate.value;
        selectedSlot.value =
            Get.find<BookingProcessMainController>().selectedSlot.value;
        await checkTimeSpeciality(selectedDate.value,
            Get.find<BookingProcessMainController>().requestParamBooking);
        break;
      case TypeService.labExam:
        selectedSlot.value =
            Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await getDutyScheduleExamination(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      case TypeService.psychological:
        Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await getDutySchedulePsychology(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      case TypeService.vaccination:
        Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await getDutyScheduleVacination(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      default:
    }
  }

  checkTimeByTypeService(DateTime dateTime) async {
    try {
      switch (type) {
        case TypeService.generalExam:
          await checkTimeGeneral(dateTime,
              Get.find<BookingGeneralController>().requestParamBooking);
          break;
        case TypeService.specialtyExam:
          await checkTimeSpeciality(dateTime,
              Get.find<BookingProcessMainController>().requestParamBooking);
          break;
        case TypeService.labExam:
          await getDutyScheduleExamination(selectedDate.value,
              Get.find<BookingMedicalSerivceController>().requestParamBooking);
          break;
        case TypeService.psychological:
          await getDutySchedulePsychology(selectedDate.value,
              Get.find<BookingMedicalSerivceController>().requestParamBooking);
          break;
        case TypeService.vaccination:
           await getDutyScheduleVacination(selectedDate.value,
              Get.find<BookingMedicalSerivceController>().requestParamBooking);
          break;
        default:
      }
    } catch (e) {
      log("222" + '$e');
    }
  }

  checkTimeGeneral(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    selectedSlot.value = DutySchedule.emtyObject();
    // await BookingRemote()
    //     .checkDutyScheduleMagical(date: dateSelected)
    //     .then((value) {
    //   listDutySchedule.value = value;
    //   log("message:${listDutySchedule.toList()}");
    // }).catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
    // await BookingRemote()
    //     .checkDutyScheduleGeneral(
    //         clinicId: requestParamBooking.clinic!.id, date: dateSelected)
    //     .then((value) {
    //   listDutySchedule.value = value;
    //   log("message:" + listDutySchedule.value.toList().toString());
    // }).catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }

  checkTimeSpeciality(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    // await BookingRemote()
    //     .checkDutyScheduleMagical(date: dateSelected)
    //     .then((value) {
    //   listDutySchedule.value = value;
    //   listDutySchedule.value.sort((a, b) => a.slotNumber.compareTo(b.slotNumber));
    //   log("message:${listDutySchedule.value.toList()}");
    // }).catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
    // await BookingRemote()
    //     .checkDutyScheduleSpecialty(
    //         clinicId: requestParamBooking.clinic!.id,
    //         date: dateSelected,
    //         doctorId: requestParamBooking.doctor?.id,
    //         specialtyId: requestParamBooking.specialty!.id,
    //         medicalServiceId: null)
    //     .then((value) {
    //   listDutySchedule.value = value;
    //   log("message:${listDutySchedule.toList()}");
    // }).catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }

  getDutyScheduleExamination(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    PayloadGetDutySchedule payload = PayloadGetDutySchedule();
    payload.date = DateFormat('yyyy-MM-dd').format(dateSelected);
    payload.clinicId = requestParamBooking.clinic!.id;
      await BookingRemote()
        .checkDutyScheduleExamination(
           payload: payload)
        .then((value) {
      listDutySchedule.value = value;
      log("message:${listDutySchedule.toList()}");
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  getDutySchedulePsychology(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    PayloadGetDutySchedule payload = PayloadGetDutySchedule();
    payload.date = DateFormat('yyyy-MM-dd').format(dateSelected);
    payload.clinicId = requestParamBooking.clinic!.id;
      await BookingRemote()
        .checkDutySchedulePsychology(
           payload: payload)
        .then((value) {
      listDutySchedule.value = value;
      log("message:${listDutySchedule.toList()}");
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  getDutyScheduleVacination(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    PayloadGetDutySchedule payload = PayloadGetDutySchedule();
    payload.date = DateFormat('yyyy-MM-dd').format(dateSelected);
    payload.clinicId = requestParamBooking.clinic!.id;
      await BookingRemote()
        .checkDutyScheduleVacination(
           payload: payload)
        .then((value) {
      listDutySchedule.value = value;
      log("message:${listDutySchedule.toList()}");
    }).catchError(handleError);
  }

  onSelectedSlot(DutySchedule slot) {
    if (slot.isAvaiable) {
      selectedSlot.value = slot;
    }
    log(selectedSlot.value.toJson().toString());
  }

  onTapSubmitButton() async {
    switch (type) {
      case TypeService.generalExam:
        await Get.find<BookingGeneralController>()
            .setTimeSlotChoice(selectedDate.value, selectedSlot.value);
        break;
      case TypeService.specialtyExam:
        log(selectedSlot.value.toJson().toString());
        await Get.find<BookingProcessMainController>()
            .setTimeSlotChoice(selectedDate.value, selectedSlot.value);
        break;
      case TypeService.labExam:
        await Get.find<BookingMedicalSerivceController>()
            .setTimeSlotChoice(selectedDate.value, selectedSlot.value);
        break;
      case TypeService.psychological:
        await Get.find<BookingMedicalSerivceController>()
            .setTimeSlotChoice(selectedDate.value, selectedSlot.value);
        break;
      case TypeService.vaccination:
        await Get.find<BookingMedicalSerivceController>()
            .setTimeSlotChoice(selectedDate.value, selectedSlot.value);
        break;
      default:
    }
  }
}
