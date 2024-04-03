import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';

abstract class BookingApi {
  Future<List<BookingPreview>> getListBookingNewest();
  Future<BookingPreview> getAppointmentDetail();
  Future<List<BookingPreview>> getListAppointment({required bool isHistory});
  Future<List<BookingPreview>> getListTransaction();
  
  Future<List<DutySchedule>> checkDutyScheduleGeneral({required DateTime date, required String clinicId});
  Future<List<DutySchedule>> checkDutyScheduleSpecialty({required DateTime date, required String clinicId, required String doctorId, required String medicalServiceId});
  Future<List<DutySchedule>> checkDutyScheduleMedicalService({required DateTime date, required String clinicId, required String doctorId, required String medicalServiceId});
}