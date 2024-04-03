// To parse this JSON data, do
//
//     final medicalService = medicalServiceFromJson(jsonString);

import 'dart:convert';

MedicalService medicalServiceFromJson(String str) => MedicalService.fromJson(json.decode(str));

String medicalServiceToJson(MedicalService data) => json.encode(data.toJson());

class MedicalService {
    String medicalSpecialtyName;
    String medicalServiceName;

    MedicalService({
        required this.medicalSpecialtyName,
        required this.medicalServiceName,
    });

    MedicalService copyWith({
        String? medicalSpecialtyName,
        String? medicalServiceName,
    }) => 
        MedicalService(
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            medicalServiceName: medicalServiceName ?? this.medicalServiceName,
        );

    factory MedicalService.fromJson(Map<String, dynamic> json) => MedicalService(
        medicalSpecialtyName: json["medicalSpecialtyName"],
        medicalServiceName: json["medicalServiceName"],
    );

    Map<String, dynamic> toJson() => {
        "medicalSpecialtyName": medicalSpecialtyName,
        "medicalServiceName": medicalServiceName,
    };
}
