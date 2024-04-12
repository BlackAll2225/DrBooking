import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/create-booking/request_create_booking.dart';
import 'package:drbooking/app/model/booking/create-booking/response_create_booking.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
class BookingRemote implements BookingApi {
  ApiService apiService = ApiService();
  @override
  Future<AppointmentDetail> getAppointmentDetail(
      {required String idAppointment}) async {
    AppointmentDetail appointment = await apiService.fetchDataObjectWithPost(
        BaseLink.getAppointmentById, (p0) => AppointmentDetail.fromJson(p0),
        body: idAppointment);
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
  Future<List<DutySchedule>> checkDutyScheduleGeneral(
      {required DateTime date, required String clinicId}) async {
    log(clinicId);
    List<DutySchedule> listDuty = await apiService.fetchDataListWithPost(
        BaseLink.checkDutyScheduleGeneral, (p0) => DutySchedule.fromJson(p0),
        body: {
          "date": DateFormat('yyyy-MM-dd').format(date),
          "clinicId": clinicId
        });
    log({"date": DateFormat('yyyy-MM-dd').format(date), "clinicId": clinicId}
        .toString());
    return listDuty;
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleMedicalService(
      {required DateTime date,
      required String clinicId,
      required String medicalServiceId}) async {
    List<DutySchedule> listDuty = await apiService.fetchDataListWithPost(
        BaseLink.checkDutyScheduleGeneral, (p0) => DutySchedule.fromJson(p0),
        body: {
          "medicalServiceId": medicalServiceId,
          "date": DateFormat('yyyy-MM-dd').format(date),
          "clinicId": clinicId
        });
    return listDuty;
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleSpecialty(
      {required DateTime date,
      required String clinicId,
      required String? doctorId,
      required String? medicalServiceId,
      required String? specialtyId}) async {
    List<DutySchedule> listDuty = await apiService.fetchDataListWithPost(
        BaseLink.checkDutyScheduleSpecialty, (p0) => DutySchedule.fromJson(p0),
        body: {
          "medicalSpecialtyId": specialtyId,
          "date": DateFormat('yyyy-MM-dd').format(date),
          "clinicId": clinicId,
          "doctorId": doctorId,
          "medicalServiceId": medicalServiceId
        });
    log(jsonEncode({
      "medicalSpecialtyId": specialtyId,
      "date": DateFormat('yyyy-MM-dd').format(date),
      "clinicId": clinicId,
      "doctorId": doctorId,
      "medicalServiceId": medicalServiceId
    }));
    return listDuty;
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentComming(
      String clientId, String patientId) async {
    Map<String, dynamic> body = {};
    clientId.isNotEmpty ? body['clientId'] = clientId : null;
    patientId.isNotEmpty ? body['patientId'] = patientId : null;
    List<AppointmentPreview> listAppointment =
        await apiService.fetchDataListWithPost(BaseLink.getAppointmentComming,
            (p0) => AppointmentPreview.fromJson(p0),
            body: body);
    return listAppointment;
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentFinish(
      String clientId, String patientId) async {
    Map<String, dynamic> body = {};
    clientId.isNotEmpty ? body['clientId'] = clientId : null;
    patientId.isNotEmpty ? body['patientId'] = patientId : null;
    List<AppointmentPreview> listAppointment =
        await apiService.fetchDataListWithPost(BaseLink.getAppointmentFinish,
            (p0) => AppointmentPreview.fromJson(p0),
            body: body);
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
      required String clinicId,
      required double lat,
      required double lng}) async {
    bool check = await apiService
        .validationWithPost(BaseLink.checkinAppointment, body: {
      "appointmentId": appointmentId,
      "clinicId": clinicId,
      "lat": lat,
      "lng": lng
    });
    return check;
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleMagical(
      {required DateTime date}) async {
        String endpoint =  'doctorId=4d2fa8ac-a196-4e6b-9a4f-d810af589e70&&date=${DateFormat('yyyy-MM-dd').format(date)}';
    List<DutySchedule> listDuty = await apiService.fetchDataList(
      BaseLink.checkDutyScheduleTest + endpoint,
      (p0) => DutySchedule.fromJson(p0),
    );
    return listDuty;
  }

  @override
  Future<String> createBooking({required PayloadCreateBooking payload}) async{
   final response = await http.post(Uri.parse(BaseLink.createAppointment),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(payload.toJson()));

    if (json.decode(response.body)['status'] == 'Status200OK') {
      final String payment_url = json.decode(response.body)["data"];
      return payment_url;
    } else
      throw Exception('Failed to load data');
  }
}
