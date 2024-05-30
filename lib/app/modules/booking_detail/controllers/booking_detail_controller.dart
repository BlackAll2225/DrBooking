import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class BookingDetailController extends BaseController {
  //TODO: Implement BookingDetailController
  BookingDetailController({
    required this.idAppointment,
  });
  final count = 0.obs;
  String idAppointment;
  late Rx<String> dateSlot = ''.obs;
  late Rx<String> slot = ''.obs;
  Rx<AppointmentDetail> appointment = AppointmentDetail().obs;
  late Position currentPosition;
  List<String> templateReasonReview = [
    "Bệnh viện sạch sẽ",
    "Nhân viên chu đáo",
    "Bác sĩ tận tâm",
    "Khác"
  ];
  List<String> templateReasonCancel = [
    "Thay đổi lịch trình",
    "Tôi muốn chọn bác sĩ khác",
    "Khác"
  ];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

  Rx<String> reasonChoice = 'Khác'.obs;
  @override
  Future<void> onInit() async {
    await fetchAppointmentDetail();
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

  fetchAppointmentDetail() async {
    isLoading(true);
    await BookingRemote()
        .getAppointmentDetail(idAppointment: idAppointment)
        .then((value) {
      appointment.value = value;
      dateSlot.value =
          FormatDataCustom.convertDatetoFullDate(date: value.start.toString());
      slot.value =
          '${FormatDataCustom.mappingIso8ToSlot(value.start.toString())}-${FormatDataCustom.mappingIso8ToSlot(value.end.toString())}';
    }).catchError((error) {
      Get.back();
      log("err:$error");
      isLockButton(false);
      isLoading(false);
      UtilCommon.snackBar(text: '${error.message}', isFail: true);
    });
    isLoading(false);
  }

  checkIn() async {
    DateTime timeA = DateTime.now();
    DateTime timeB = appointment.value.start!;
    if (timeB.difference(timeA).inMinutes > 0 &&
        timeB.difference(timeA).inMinutes < 30 &&
        timeB.difference(timeA).inHours < 2) {
      await QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.warning,
        title: 'Không hợp lệ',
        text: 'Bạn chỉ có thể checkin trước thời gian tối đa 30 phút',
        confirmBtnText: 'Trở về',
        onConfirmBtnTap: () {
          Get.back();
        },
      );
    } else {
      await checkLocationPermission();
      await BookingRemote()
          .checkIn(
              appointmentId: appointment.value.idAppointment!,
              lat: currentPosition.latitude,
              lng: currentPosition.longitude)
          .then((value) async {
        if (value) {
          await QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            title: 'Xin chân thành cảm ơn',
            text: 'Chúc bạn có một trải nghiệm tốt đẹp',
            confirmBtnText: 'Trở về',
            onConfirmBtnTap: () {
              Get.offNamed(Routes.HOME);
            },
          );
        }
      }).catchError((error) {
        log("err:$error");
        isLockButton(false);
        UtilCommon.snackBar(text: '${error.message}', isFail: true);
      });
    }
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if ((permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) &&
        await Geolocator.isLocationServiceEnabled()) {
      currentPosition = await Geolocator.getCurrentPosition();
    } else {
      log("fail");
    }
  }

  submitReview(int rating) async {
    String review = reasonChoice.value;
    if (reasonChoice == 'Khác') {
      review = textEdittingController.text;
    }
    await BookingRemote()
        .feedbackAppointment(
            appointmentId: idAppointment, rating: rating, review: review)
        .then((value) async {
      if (value) {
        Get.back();
        UtilCommon.snackBar(
          text: 'Đánh giá thành công',
        );
        await fetchAppointmentDetail();
      }
    }).catchError(handleError);
  }

  cancelRequest() async {
    String reason = reasonChoice.value;
    if (reasonChoice == 'Khác') {
      reason = textEdittingController.text;
    }
    DateTime timeA = DateTime.now();
    DateTime timeB = appointment.value.start!;
    int differenceInMinutes = timeB.difference(timeA).inHours;
    if (differenceInMinutes < 24) {
      await QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: 'Không hợp lệ',
        text: 'Bạn chỉ có thể huỷ đơn trước 24 tiếng',
        confirmBtnText: 'Trở về',
        onConfirmBtnTap: () {
          Get.back();
        },
      );
    } else {
      //Cancel
       await BookingRemote()
        .cancelAppointment(
            appointmentId: idAppointment, cancellationReason: reason)
        .then((value) async {
      if (value) {
        Get.back();
        UtilCommon.snackBar(
          text: 'Huỷ thành công',
        );
        await fetchAppointmentDetail();
      }
    }).catchError(handleError);
    }
  }
}
