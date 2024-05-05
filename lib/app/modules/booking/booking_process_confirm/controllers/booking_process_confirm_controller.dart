import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/base/config.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/model/booking/payload/request_create_booking.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingProcessConfirmController extends BaseController {
  //TODO: Implement BookingProcessConfirmController
  BookingProcessConfirmController({required this.requestParam});
  RequestParamBooking requestParam;
  final count = 0.obs;
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

  getLinkPayment() async {
    PayloadCreateBooking payload = PayloadCreateBooking();
    payload.medicalServiceId = requestParam.medicalService?.id;
    payload.medicalSpecialtyId = requestParam.specialty?.id;
    payload.patientProfileId = requestParam.patient!.patientId!;
    payload.symptoms = requestParam.symptom!;
    payload.note = null;
    payload.dutyScheduleId = requestParam.dutySchedule!.dutyScheduleId;
    payload.appointmentType = UtilCommon.getEnumAppointmentType(requestParam.dataButton!.type);
    await BookingRemote().createBooking(payload: payload).then((value) async {
      String payment = value;
      log(payment);
      if (await canLaunchUrl(Uri.parse(payment))) {
        await launchUrl(Uri.parse(payment),
            mode: LaunchMode.externalApplication);
      }
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      isLoading(false);
      UtilCommon.snackBar(text: '${error.message}', isFail: true);
    });
  }
}
