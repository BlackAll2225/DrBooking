import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/resources/base_link.dart';

class BookingRemote implements BookingApi{
  ApiService apiService = ApiService();
  @override
  Future<BookingPreview> getAppointmentDetail() {
    BaseLink.getAppointmentById;
    // TODO: implement getBookingDetail
    throw UnimplementedError();
  }

  @override
  Future<List<BookingPreview>> getListBookingNewest() {
    // TODO: implement getListBookingNewest
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookingPreview>> getListAppointment({required bool isHistory}) async{
    BaseLink.getAppointments;
    // TODO: implement getListAppointment
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookingPreview>> getListTransaction() {
    // TODO: implement getListTransaction
    throw UnimplementedError();
  }
  
  @override
  Future<List<DutySchedule>> checkDutyScheduleGeneral({required DateTime date, required String clinicId}) async{
    log(clinicId);
    List<DutySchedule> listDuty = await apiService.fetchDataListWithPost(BaseLink.checkDutyScheduleGeneral, (p0) => DutySchedule.fromJson(p0), body: {
      "date": '2024-03-28',
      "clinicId": clinicId
    });
      return listDuty;
  }
  
  @override
  Future<List<DutySchedule>> checkDutyScheduleMedicalService({required DateTime date, required String clinicId, required String doctorId, required String medicalServiceId}) {
    // TODO: implement checkDutyScheduleMedicalService
    throw UnimplementedError();
  }
  
  @override
  Future<List<DutySchedule>> checkDutyScheduleSpecialty({required DateTime date, required String clinicId, required String doctorId, required String medicalServiceId}) async{
    // List<DutySchedule> listDuty = await apiService.fetchDataListWithPost(BaseLink.checkDutyScheduleSpecialty, (p0) => null, body: body)
    // TODO: implement checkDutyScheduleSpecialty
    throw UnimplementedError();
  }
}