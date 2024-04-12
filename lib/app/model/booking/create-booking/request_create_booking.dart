// To parse this JSON data, do
//
//     final payloadCreateBooking = payloadCreateBookingFromJson(jsonString);

import 'dart:convert';

PayloadCreateBooking payloadCreateBookingFromJson(String str) => PayloadCreateBooking.fromJson(json.decode(str));

String payloadCreateBookingToJson(PayloadCreateBooking data) => json.encode(data.toJson());

class PayloadCreateBooking {
    String? patientProfileId;
    String? symptoms;
    String? note;
    String? dutyScheduleId;
    int? appointmentType;

    PayloadCreateBooking({
        this.patientProfileId,
        this.symptoms,
        this.note,
        this.dutyScheduleId,
        this.appointmentType,
    });

    PayloadCreateBooking copyWith({
        String? patientProfileId,
        String? symptoms,
        String? note,
        String? dutyScheduleId,
        int? appointmentType,
    }) => 
        PayloadCreateBooking(
            patientProfileId: patientProfileId ?? this.patientProfileId,
            symptoms: symptoms ?? this.symptoms,
            note: note ?? this.note,
            dutyScheduleId: dutyScheduleId ?? this.dutyScheduleId,
            appointmentType: appointmentType ?? this.appointmentType,
        );

    factory PayloadCreateBooking.fromJson(Map<String, dynamic> json) => PayloadCreateBooking(
        patientProfileId: json["patientProfileId"],
        symptoms: json["symptoms"],
        note: json["note"],
        dutyScheduleId: json["dutyScheduleId"],
        appointmentType: json["appointmentType"],
    );

    Map<String, dynamic> toJson() => {
        "patientProfileId": patientProfileId,
        "symptoms": symptoms,
        "note": note,
        "dutyScheduleId": dutyScheduleId,
        "appointmentType": appointmentType,
    };
}
