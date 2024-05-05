import 'package:drbooking/app/model/booking/payload/get_appointment_payload.dart';
import 'package:drbooking/app/model/booking/booking.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_check_duty_schedule.dart';
import 'package:drbooking/app/model/booking/payload/request_create_booking.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';

abstract class BookingApi {
  Future<List<AppointmentPreview>> getListBookingNewest();
  Future<List<AppointmentPreview>> getListTransaction();
  Future<List<MedicalRecord>> getListMedicalRecordByIdPatient({required String patientId});

  Future<AppointmentDetail> getAppointmentDetail({required String idAppointment});
  Future<List<AppointmentPreview>> getListAppointment({required bool isHistory});
//********************************************* */
  Future<List<DutySchedule>> checkDutyScheduleGeneral({required PayloadGetDutySchedule payload});
  Future<List<DutySchedule>> checkDutyScheduleSpecialty({required PayloadGetDutySchedule payload});
  Future<List<DutySchedule>> checkDutyScheduleVacination({required PayloadGetDutySchedule payload});
  Future<List<DutySchedule>> checkDutyScheduleExamination({required PayloadGetDutySchedule payload});
  Future<List<DutySchedule>> checkDutySchedulePsychology({required PayloadGetDutySchedule payload});

  
  Future<List<AppointmentPreview>> getListAppointmentComming( {required PayloadGetAppointment payload});
  Future<List<AppointmentPreview>> getListAppointmentFinish({required PayloadGetAppointment payload});


  Future<bool> checkIn({required String appointmentId, required double lat, required double lng});
  Future<bool> cancelAppointment({required String appointmentId, required String cancellationReason});
  Future<bool> feedbackAppointment({required String appointmentId, required int rating, required String review});

  
  Future<String> createBooking({required PayloadCreateBooking payload});

}