import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/modules/booking_general/controllers/booking_general_controller.dart';
import 'package:drbooking/app/modules/booking_medical_serivce/controllers/booking_medical_serivce_controller.dart';
import 'package:drbooking/app/modules/booking_process/controllers/booking_process_controller.dart';
import 'package:drbooking/app/modules/booking_specialty/controllers/booking_specialty_controller.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:get/get.dart';



class BookingProcessTimeController extends BaseController {
  //TODO: Implement BookingProcessTimeController

  BookingProcessTimeController({required this.type});
  TypeService type;
  Rx<DateTime> selectedDate = DateTime.now().obs;
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
            Get.find<BookingProcessController>().selectedDate.value;
        selectedSlot.value =
            Get.find<BookingProcessController>().selectedSlot.value;
        await checkTimeSpeciality(selectedDate.value,
            Get.find<BookingProcessController>().requestParamBooking);
        break;
      case TypeService.labExam:
        selectedSlot.value =
            Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await checkTimeMedicalService(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      case TypeService.psychological:
            Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await checkTimeMedicalService(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      case TypeService.vaccination:
             Get.find<BookingMedicalSerivceController>().selectedSlot.value;
        selectedDate.value =
            Get.find<BookingMedicalSerivceController>().selectedDate.value;
        await checkTimeMedicalService(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
        break;
      default:
    }
  }

  getControllerCheckTime(DateTime dateTime) async {
    selectedSlot.value = DutySchedule.emtyObject();
    try {
      switch (type) {
        case TypeService.generalExam:
          await checkTimeGeneral(dateTime,
              Get.find<BookingGeneralController>().requestParamBooking);
          break;
        case TypeService.specialtyExam:
          await checkTimeSpeciality(dateTime,
              Get.find<BookingProcessController>().requestParamBooking);
          break;
        case TypeService.labExam:
        await checkTimeMedicalService(selectedDate.value,
            Get.find<BookingMedicalSerivceController>().requestParamBooking);
          break;
        case TypeService.psychological:
          await Get.find<BookingMedicalSerivceController>()
              .checkTimeService(dateTime);
          break;
        case TypeService.vaccination:
          await Get.find<BookingMedicalSerivceController>()
              .checkTimeService(dateTime);
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
    await BookingRemote()
        .checkDutyScheduleGeneral(
            clinicId: requestParamBooking.clinic!.id, date: dateSelected)
        .then((value) {
      listDutySchedule.value = value;
      log("message:" + listDutySchedule.value.toList().toString());
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  checkTimeSpeciality(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;

    await BookingRemote()
        .checkDutyScheduleSpecialty(
            clinicId: requestParamBooking.clinic!.id,
            date: dateSelected,
            doctorId: requestParamBooking.doctor?.id,
            specialtyId: requestParamBooking.specialty!.id,
            medicalServiceId: null)
        .then((value) {
      listDutySchedule.value = value;
      log("message:${listDutySchedule.toList()}");
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  checkTimeMedicalService(
      DateTime dateSelected, RequestParamBooking requestParamBooking) async {
    selectedDate.value = dateSelected;
    await BookingRemote()
        .checkDutyScheduleMedicalService(
            clinicId: requestParamBooking.clinic!.id,
            date: dateSelected,
            medicalServiceId: '')
        .then((value) {
      listDutySchedule.value = value;
      log("message:${listDutySchedule.toList()}");
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
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
        await Get.find<BookingProcessController>()
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
