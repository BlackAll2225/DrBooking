import 'package:drbooking/app/model/booking/payload/get_appointment_payload.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_check_duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_create_booking.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';

class BookingLocal implements BookingApi {
  @override
  Future<AppointmentDetail> getAppointmentDetail(
      {required String idAppointment}) async {
    throw Exception();
    //   await Future.delayed(Duration(seconds: 1));
    // return null;
  }

  @override
  Future<List<AppointmentPreview>> getListBookingNewest() async {
    throw Exception();
    // await Future.delayed(Duration(seconds: 1));
    // List<AppointmentPreview> listBookingPreview = [
    //   AppointmentPreview( time: '8:00 - 10:00', date: '2024-04-15', name: 'Everardo McClure', branch: 'Chi nhánh Khai Nguyen', isNew: true),
    //   // BookingPreview( time: '8:00 - 10:00', date: '2024-03-15', name: 'Nguyễn Văn B', branch: 'Chi nhánh Khai Nguyen', isNew: true),
    // ];
    // return listBookingPreview;
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
  Future<List<DutySchedule>> checkDutyScheduleMedicalService(
      {required DateTime date,
      required String clinicId,
      required String medicalServiceId}) async {
    List<DutySchedule> listDutySchedule = [];
    listDutySchedule.add(DutySchedule.fromJson({
      "dutyScheduleId": "04392890-b820-47c7-a6c9-142aa09d7eb0",
      "startTime": "2024-03-28T08:00:00",
      "endTime": "2024-03-28T10:00:00",
      "slotNumber": 1,
      "isAvaiable": true,
      "countAppointment": 0
    }));
    listDutySchedule.add(DutySchedule.fromJson({
      "dutyScheduleId": "1e7ae490-ea40-4c14-9cfb-009bc745330d",
      "startTime": "2024-03-28T10:00:00",
      "endTime": "2024-03-28T12:00:00",
      "slotNumber": 2,
      "isAvaiable": false,
      "countAppointment": 0
    }));
    listDutySchedule.add(DutySchedule.fromJson({
      "dutyScheduleId": "1a17f310-3540-40ea-9395-b1d91e8d34c2",
      "startTime": "2024-03-28T13:00:00",
      "endTime": "2024-03-28T15:00:00",
      "slotNumber": 3,
      "isAvaiable": true,
      "countAppointment": 0
    }));
    listDutySchedule.add(DutySchedule.fromJson({
      "dutyScheduleId": "21accd79-0331-4923-8e23-081200b82fe8",
      "startTime": "2024-03-28T15:00:00",
      "endTime": "2024-03-28T17:00:00",
      "slotNumber": 4,
      "isAvaiable": true,
      "countAppointment": 0
    }));
    return listDutySchedule;
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentComming(
      {required PayloadGetAppointment payload}) {
    // TODO: implement getListAppointmentComming
    throw UnimplementedError();
  }

  @override
  Future<List<MedicalRecord>> getListMedicalRecordByIdPatient(
      {required String patientId}) {
    // TODO: implement getListMedicalRecordByIdPatient
    throw UnimplementedError();
  }

  @override
  Future<bool> checkIn(
      {required String appointmentId,
      required double lat,
      required double lng}) {
    // TODO: implement checkIn
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleMagical(
      {required DateTime date}) {
    // TODO: implement checkDutyScheduleMagical
    throw UnimplementedError();
  }

  @override
  Future<String> createBooking({required PayloadCreateBooking payload}) {
    // TODO: implement createBooking
    throw UnimplementedError();
  }

  @override
  Future<List<AppointmentPreview>> getListAppointmentFinish(
      {required PayloadGetAppointment payload}) {
    // TODO: implement getListAppointmentFinish
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleExamination(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleExamination
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleGeneral(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleGeneral
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutySchedulePsychology(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutySchedulePsychology
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleSpecialty(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleSpecialty
    throw UnimplementedError();
  }

  @override
  Future<List<DutySchedule>> checkDutyScheduleVacination(
      {required PayloadGetDutySchedule payload}) {
    // TODO: implement checkDutyScheduleVacination
    throw UnimplementedError();
  }
  
  @override
  Future<bool> cancelAppointment({required String appointmentId, required String cancellationReason}) {
    // TODO: implement cancelAppointment
    throw UnimplementedError();
  }
  
  @override
  Future<bool> feedbackAppointment({required String appointmentId, required int rating, required String review}) {
    // TODO: implement feedbackAppointment
    throw UnimplementedError();
  }
}
