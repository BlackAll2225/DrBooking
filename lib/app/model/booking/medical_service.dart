// To parse this JSON data, do
//
//     final medicalService = medicalServiceFromJson(jsonString);

import 'dart:convert';

MedicalService medicalServiceFromJson(String str) => MedicalService.fromJson(json.decode(str));

String medicalServiceToJson(MedicalService data) => json.encode(data.toJson());

class MedicalService {
    String? id;
    String? medicalSpecialtyName;
    String? medicalServiceName;

    MedicalService({
        this.id,
        this.medicalSpecialtyName,
        this.medicalServiceName,
    });

    MedicalService copyWith({
        String? id,
        String? medicalSpecialtyName,
        String? medicalServiceName,
    }) => 
        MedicalService(
            id: id ?? this.id,
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            medicalServiceName: medicalServiceName ?? this.medicalServiceName,
        );

    factory MedicalService.fromJson(Map<String, dynamic> json) => MedicalService(
        id: json["id"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        medicalServiceName: json["medicalServiceName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "medicalSpecialtyName": medicalSpecialtyName,
        "medicalServiceName": medicalServiceName,
    };
}
