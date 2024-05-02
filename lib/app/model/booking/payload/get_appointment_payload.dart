// To parse this JSON data, do
//
//     final payloadGetAppointment = payloadGetAppointmentFromJson(jsonString);

import 'dart:convert';

PayloadGetAppointment payloadGetAppointmentFromJson(String str) =>
    PayloadGetAppointment.fromJson(json.decode(str));

String payloadGetAppointmentToJson(PayloadGetAppointment data) =>
    json.encode(data.toJson());

class PayloadGetAppointment {
  String? patientProfileId;
  String? monthQuery;
  int? take;
  int? skip;

  PayloadGetAppointment({
    this.patientProfileId,
    this.monthQuery,
    this.take,
    this.skip,
  });

  PayloadGetAppointment copyWith({
    String? patientProfileId,
    String? monthQuery,
    int? take,
    int? skip,
  }) =>
      PayloadGetAppointment(
        patientProfileId: patientProfileId ?? this.patientProfileId,
        monthQuery: monthQuery ?? this.monthQuery,
        take: take ?? this.take,
        skip: skip ?? this.skip,
      );

  factory PayloadGetAppointment.fromJson(Map<String, dynamic> json) =>
      PayloadGetAppointment(
        patientProfileId: json["patientProfileId"],
        monthQuery: json["monthQuery"],
        take: json["take"],
        skip: json["skip"],
      );

  Map<String, dynamic> toJson() => {
        "patientProfileId": patientProfileId,
        "monthQuery": monthQuery,
        "take": take,
        "skip": skip,
      };

  String getEndPointQuery() {
    return 'take=${this.take}&&skip=${this.skip}/${this.patientProfileId ?? ''}';
  }

  String getEndPointFinishQuery() {
    String takeSkip = 'take=${this.take}&&skip=${this.skip}';
    String monthQuery =
        this.monthQuery != null ? '&&monthQuery=${this.monthQuery}' : '';
    String patientProfileId =
        this.patientProfileId != null ? '/${this.patientProfileId}' : '';
    return takeSkip + monthQuery + patientProfileId;
  }
}
