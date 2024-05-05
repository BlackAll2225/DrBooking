import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/model/booking/payload/get_appointment_payload.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_check_duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_create_booking.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class BookingRemote implements BookingApi {
  ApiService apiService = ApiService();
  @override
  Future<AppointmentDetail> getAppointmentDetail(
      {required String idAppointment}) async {
    AppointmentDetail appointment = await apiService.fetchDataObject(
      BaseLink.getAppointmentById + idAppointment,
      (p0) => AppointmentDetail.fromJson(p0),
    );
    return appointment;
  }

  @override
  Future<List<AppointmentPreview>> getListBookingNewest() {
    // TODO: implement getListBookingNewest
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentPreview>> getListAppointment(
      {required bool isHistory}) async {
    // TODO: implement getListAppointment
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentPreview>> getListTransaction() {
    // TODO: implement getListTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentComming(
      {required PayloadGetAppointment payload}) async {
    List<AppointmentPreview> listAppointment = await apiService.fetchDataList(
      BaseLink.getAppointmentComming + payload.getEndPointQuery(),
      (p0) => AppointmentPreview.fromJson(p0),
    );
    return listAppointment;
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentFinish(
      {required PayloadGetAppointment payload}) async {
    List<AppointmentPreview> listAppointment = await apiService.fetchDataList(
      BaseLink.getAppointmentFinish + payload.getEndPointFinishQuery(),
      (p0) => AppointmentPreview.fromJson(p0),
    );
    return listAppointment;
  }

  @override
  Future<List<MedicalRecord>> getListMedicalRecordByIdPatient(
      {required String patientId}) async {
    List<MedicalRecord> list = await apiService.fetchDataListWithPost(
        BaseLink.getMedicalRecordsByIdPatient,
        (p0) => MedicalRecord.fromJson(p0),
        body: patientId);
    return list;
  }

  @override
  Future<bool> checkIn(
      {required String appointmentId,
      required double lat,
      required double lng}) async {
    bool check = await apiService.validationWithPut(BaseLink.checkinAppointment,
        body: {
          "AppointmentId": appointmentId,
          "Longtitude": lat,
          "Latitude": lng
        });
    return check;
  }

  @override
  Future<String> createBooking({required PayloadCreateBooking payload}) async {
    Map<String, dynamic> body = {};
    payload.toJson().forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        body[key] = value;
      }
    });
    log("hihi2 : ${jsonEncode(body)}");
    final response = await http.post(Uri.parse(BaseLink.createAppointment),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));

    if (json.decode(response.body)['status'] == 'Status200OK') {
      final String payment_url = json.decode(response.body)["data"];
      return payment_url;
    } else
      throw Exception('Failed to load data');
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleExamination(
      {required PayloadGetDutySchedule payload}) async {
    String endpoint = 'date=${payload.date}&&clinicId=${payload.clinicId}';
    List<DutySchedule> list = await apiService.fetchDataList(
        BaseLink.checkDutyScheduleMedicalExamination + endpoint,
        (p0) => DutySchedule.fromJson(p0));
    return list;
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleGeneral(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleGeneral
    throw UnimplementedError();
}

  @override
  Future<List<DutySchedule>> checkDutySchedulePsychology(
      {required PayloadGetDutySchedule payload}) async {
    String endpoint = 'date=${payload.date}&&clinicId=${payload.clinicId}';
    List<DutySchedule> list = await apiService.fetchDataList(
        BaseLink.checkDutyScheduleMedicalPsychology + endpoint,
        (p0) => DutySchedule.fromJson(p0));
    return list;
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleSpecialty(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleSpecialty
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleVacination(
      {required PayloadGetDutySchedule payload}) async {
    String endpoint = 'date=${payload.date}&&clinicId=${payload.clinicId}';
    List<DutySchedule> list = await apiService.fetchDataList(
        BaseLink.checkDutyScheduleMedicalVacination + endpoint,
        (p0) => DutySchedule.fromJson(p0));
    return list;
  }

  @override
  Future<bool> cancelAppointment(
      {required String appointmentId, required String cancellationReason}) {
    // TODO: implement cancelAppointment
    throw UnimplementedError();
  }

  @override
  Future<bool> feedbackAppointment(
      {required String appointmentId,
      required int rating,
      required String review}) {
    // TODO: implement feedbackAppointment
    throw UnimplementedError();
  }
}
