// To parse this JSON data, do
//
//     final patientPreview = patientPreviewFromJson(jsonString);

import 'dart:convert';

PatientPreview patientPreviewFromJson(String str) => PatientPreview.fromJson(json.decode(str));

String patientPreviewToJson(PatientPreview data) => json.encode(data.toJson());

class PatientPreview {
    String? patientId;
    String? phoneNumber;
    String? fullname;
    DateTime? dateOfBirth;
    String? avatarUrl;
    int? biologicalGender;

    PatientPreview({
        this.patientId,
        this.phoneNumber,
        this.fullname,
        this.dateOfBirth,
        this.avatarUrl,
        this.biologicalGender,
    });

    PatientPreview copyWith({
        String? patientId,
        String? phoneNumber,
        String? fullname,
        DateTime? dateOfBirth,
        String? avatarUrl,
        int? biologicalGender,
    }) => 
        PatientPreview(
            patientId: patientId ?? this.patientId,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            fullname: fullname ?? this.fullname,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            biologicalGender: biologicalGender ?? this.biologicalGender,
        );

    factory PatientPreview.fromJson(Map<String, dynamic> json) => PatientPreview(
        patientId: json["patientId"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        avatarUrl: json["avatarUrl"],
        biologicalGender: json["biologicalGender"],
    );

    Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "avatarUrl": avatarUrl,
        "biologicalGender": biologicalGender,
    };
}
