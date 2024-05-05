import 'package:drbooking/app/model/booking/duty_schedule.dart';
import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/model/slot.dart';
import 'package:drbooking/app/model/special.dart';

class RequestParamBooking {
    Clinic? clinic;
    PatientPreview? patient;
    Doctor? doctor;
    Slot? slot;
    SpecialModule? special;
    String? description;
    ButtonService? dataButton;
    Specialty? specialty;
    MedicalService? medicalService;
    String? dateBooking;
    DutySchedule? dutySchedule;
    String? symptom;
    RequestParamBooking({
      this.clinic,
      this.doctor,
      this.special,
      this.description,
      this.dataButton,
      this.specialty,
      this.dateBooking,
      this.dutySchedule,
      this.symptom,
      this.patient,
      this.slot}
    );
   
}