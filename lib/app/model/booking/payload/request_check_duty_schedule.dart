// To parse this JSON data, do
//
//     final payloadGetDutySchedule = payloadGetDutyScheduleFromJson(jsonString);

import 'dart:convert';

PayloadGetDutySchedule payloadGetDutyScheduleFromJson(String str) => PayloadGetDutySchedule.fromJson(json.decode(str));

String payloadGetDutyScheduleToJson(PayloadGetDutySchedule data) => json.encode(data.toJson());

class PayloadGetDutySchedule {
    String? date;
    String? clinicId;
    String? specialtyId;

    PayloadGetDutySchedule({
        this.date,
        this.clinicId,
        this.specialtyId,
    });

    PayloadGetDutySchedule copyWith({
        String? date,
        String? clinicId,
        String? specialtyId,
    }) => 
        PayloadGetDutySchedule(
            date: date ?? this.date,
            clinicId: clinicId ?? this.clinicId,
            specialtyId: specialtyId ?? this.specialtyId,
        );

    factory PayloadGetDutySchedule.fromJson(Map<String, dynamic> json) => PayloadGetDutySchedule(
        date: json["date"],
        clinicId: json["clinicId"],
        specialtyId: json["specialtyId"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "clinicId": clinicId,
        "specialtyId": specialtyId,
    };
}
