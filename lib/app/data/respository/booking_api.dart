import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/create-booking/request_create_booking.dart';
import 'package:drbooking/app/model/booking/create-booking/response_create_booking.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';

abstract class BookingApi {
  Future<List<AppointmentPreview>> getListBookingNewest();
  Future<AppointmentDetail> getAppointmentDetail({required String idAppointment});
  Future<List<AppointmentPreview>> getListAppointment({required bool isHistory});
  Future<List<AppointmentPreview>> getListTransaction();
  
  Future<List<DutySchedule>> checkDutyScheduleGeneral({required DateTime date, required String clinicId});
  Future<List<DutySchedule>> checkDutyScheduleSpecialty({required DateTime date, required String clinicId, required String doctorId, required String? medicalServiceId, required String? specialtyId});
  Future<List<DutySchedule>> checkDutyScheduleMedicalService({required DateTime date, required String clinicId, required String medicalServiceId});
  Future<List<DutySchedule>> checkDutyScheduleMagical({required DateTime date});
  
  Future<List<AppointmentPreview>> getListAppointmentComming(String clientId, String patientId);
  Future<List<AppointmentPreview>> getListAppointmentFinish(String clientId, String patientId);
  Future<List<MedicalRecord>> getListMedicalRecordByIdPatient({required String patientId});

  Future<bool> checkIn({required String appointmentId,required String clinicId, required double lat, required double lng});
  
  Future<String> createBooking({required PayloadCreateBooking payload});

}