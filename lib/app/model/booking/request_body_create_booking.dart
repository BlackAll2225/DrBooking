// To parse this JSON data, do
//
//     final bodyRequestCreateBooking = bodyRequestCreateBookingFromJson(jsonString);

import 'dart:convert';

import 'package:drbooking/app/model/service/button_service.dart';

BodyRequestCreateBooking bodyRequestCreateBookingFromJson(String str) => BodyRequestCreateBooking.fromJson(json.decode(str));

String bodyRequestCreateBookingToJson(BodyRequestCreateBooking data) => json.encode(data.toJson());

class BodyRequestCreateBooking {
    String? clinicId;
    String? medicalServiceId;
    String? medicalSpecialty;
    String? patientProfileId;
    String? symptoms;
    String? dutyScheduleId;
    int? appointmentType;
    TypeService? typeService;
    BodyRequestCreateBooking({
        this.clinicId,
        this.medicalServiceId,
        this.medicalSpecialty,
        this.patientProfileId,
        this.symptoms,
        this.dutyScheduleId,
        this.appointmentType,
    });

    BodyRequestCreateBooking copyWith({
        String? clinicId,
        String? medicalServiceId,
        String? medicalSpecialty,
        String? patientProfileId,
        String? symptoms,
        String? dutyScheduleId,
        int? appointmentType,
    }) => 
        BodyRequestCreateBooking(
            clinicId: clinicId ?? this.clinicId,
            medicalServiceId: medicalServiceId ?? this.medicalServiceId,
            medicalSpecialty: medicalSpecialty ?? this.medicalSpecialty,
            patientProfileId: patientProfileId ?? this.patientProfileId,
            symptoms: symptoms ?? this.symptoms,
            dutyScheduleId: dutyScheduleId ?? this.dutyScheduleId,
            appointmentType: appointmentType ?? this.appointmentType,
        );

    factory BodyRequestCreateBooking.fromJson(Map<String, dynamic> json) => BodyRequestCreateBooking(
        clinicId: json["clinicId"],
        medicalServiceId: json["medicalServiceId"],
        medicalSpecialty: json["medicalSpecialty"],
        patientProfileId: json["patientProfileId"],
        symptoms: json["symptoms"],
        dutyScheduleId: json["dutyScheduleId"],
        appointmentType: json["appointmentType"],
    );

    Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "medicalServiceId": medicalServiceId,
        "medicalSpecialty": medicalSpecialty,
        "patientProfileId": patientProfileId,
        "symptoms": symptoms,
        "dutyScheduleId": dutyScheduleId,
        "appointmentType": appointmentType,
    };

    int convertEnumAppointType(){
      return 0;
      // switch (typeService) {
      //   case TypeService.generalExam:
      //    return 1;
      //   case TypeService.specialtyExam:
      //     return 1;
      //   case TypeService.labExam:
      //   return 0;
      //   case TypeService.psychological:

      //   case TypeService.vaccination:
        
      //   default:
      // }
    }
}
