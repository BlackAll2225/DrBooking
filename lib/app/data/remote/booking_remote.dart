import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:intl/intl.dart';

class BookingRemote implements BookingApi {
  ApiService apiService = ApiService();
  @override
  Future<AppointmentPreview> getAppointmentDetail() {
    BaseLink.getAppointmentById;
    // TODO: implement getBookingDetail
    throw UnimplementedError();
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
        BaseLink.checkDutyScheduleGeneral, (p0) => DutySchedule.fromJson(p0),
        body: {
          "medicalSpecialtyId": specialtyId,
          "date": DateFormat('yyyy-MM-dd').format(date),
          "clinicId": clinicId,
          "doctorId": doctorId,
          "medicalServiceId": medicalServiceId
        });
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
      String clientId, String patientId) async{
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
  Future<List<MedicalRecord>> getListMedicalRecordByIdPatient({required String patientId}) async{
    List<MedicalRecord> list = await apiService.fetchDataListWithPost(BaseLink.getMedicalRecordsByIdPatient, (p0) => MedicalRecord.fromJson(p0), body: patientId);
        return list;
  }
}
