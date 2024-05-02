// To parse this JSON data, do
//
//     final payloadCreateBooking = payloadCreateBookingFromJson(jsonString);

import 'dart:convert';

PayloadCreateBooking payloadCreateBookingFromJson(String str) => PayloadCreateBooking.fromJson(json.decode(str));

String payloadCreateBookingToJson(PayloadCreateBooking data) => json.encode(data.toJson());

class PayloadCreateBooking {
    String? medicalServiceId;
    String? medicalSpecialtyId;
    String? patientProfileId;
    String? symptoms;
    String? note;
    String? dutyScheduleId;
    int? appointmentType;

    PayloadCreateBooking({
        this.medicalServiceId,
        this.medicalSpecialtyId,
        this.patientProfileId,
        this.symptoms,
        this.note,
        this.dutyScheduleId,
        this.appointmentType,
    });

    PayloadCreateBooking copyWith({
        String? medicalServiceId,
        String? medicalSpecialtyId,
        String? patientProfileId,
        String? symptoms,
        String? note,
        String? dutyScheduleId,
        int? appointmentType,
    }) => 
        PayloadCreateBooking(
            medicalServiceId: medicalServiceId ?? this.medicalServiceId,
            medicalSpecialtyId: medicalSpecialtyId ?? this.medicalSpecialtyId,
            patientProfileId: patientProfileId ?? this.patientProfileId,
            symptoms: symptoms ?? this.symptoms,
            note: note ?? this.note,
            dutyScheduleId: dutyScheduleId ?? this.dutyScheduleId,
            appointmentType: appointmentType ?? this.appointmentType,
        );

    factory PayloadCreateBooking.fromJson(Map<String, dynamic> json) => PayloadCreateBooking(
        medicalServiceId: json["medicalServiceId"],
        medicalSpecialtyId: json["medicalSpecialtyId"],
        patientProfileId: json["patientProfileId"],
        symptoms: json["symptoms"],
        note: json["note"],
        dutyScheduleId: json["dutyScheduleId"],
        appointmentType: json["appointmentType"],
    );

    Map<String, dynamic> toJson() => {
        "medicalServiceId": medicalServiceId,
        "medicalSpecialtyId": medicalSpecialtyId,
        "patientProfileId": patientProfileId,
        "symptoms": symptoms,
        "note": note,
        "dutyScheduleId": dutyScheduleId,
        "appointmentType": appointmentType,
    };
}
