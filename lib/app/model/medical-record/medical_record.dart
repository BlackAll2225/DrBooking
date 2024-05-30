// To parse this JSON data, do
//
//     final medicalRecord = medicalRecordFromJson(jsonString);

import 'dart:convert';

MedicalRecord medicalRecordFromJson(String str) => MedicalRecord.fromJson(json.decode(str));

String medicalRecordToJson(MedicalRecord data) => json.encode(data.toJson());

class MedicalRecord {
    String? patientProfileId;
    String? patientCode;
    int? biologicalGender;
    DateTime? dateOfBirth;
    String? phoneNumber;
    int? height;
    int? weight;
    int? appoinmentType;
    String? doctorName;
    String? medicalSpecialtyName;
    String? room;
    String? clinicName;
    DateTime? startTime;
    DateTime? endTime;
    int? slotNumber;
    String? note;
    String? symptom;
    String? prescription;
    dynamic reExaminationDate;
    String? appointmentId;
    String? id;
    bool? isActive;
    DateTime? createdAt;

    MedicalRecord({
        this.patientProfileId,
        this.patientCode,
        this.biologicalGender,
        this.dateOfBirth,
        this.phoneNumber,
        this.height,
        this.weight,
        this.appoinmentType,
        this.doctorName,
        this.medicalSpecialtyName,
        this.room,
        this.clinicName,
        this.startTime,
        this.endTime,
        this.slotNumber,
        this.note,
        this.symptom,
        this.prescription,
        this.reExaminationDate,
        this.appointmentId,
        this.id,
        this.isActive,
        this.createdAt,
    });

    MedicalRecord copyWith({
        String? patientProfileId,
        String? patientCode,
        int? biologicalGender,
        DateTime? dateOfBirth,
        String? phoneNumber,
        int? height,
        int? weight,
        int? appoinmentType,
        String? doctorName,
        String? medicalSpecialtyName,
        String? room,
        String? clinicName,
        DateTime? startTime,
        DateTime? endTime,
        int? slotNumber,
        String? note,
        String? symptom,
        String? prescription,
        dynamic reExaminationDate,
        String? appointmentId,
        String? id,
        bool? isActive,
        DateTime? createdAt,
    }) => 
        MedicalRecord(
            patientProfileId: patientProfileId ?? this.patientProfileId,
            patientCode: patientCode ?? this.patientCode,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            height: height ?? this.height,
            weight: weight ?? this.weight,
            appoinmentType: appoinmentType ?? this.appoinmentType,
            doctorName: doctorName ?? this.doctorName,
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            room: room ?? this.room,
            clinicName: clinicName ?? this.clinicName,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            slotNumber: slotNumber ?? this.slotNumber,
            note: note ?? this.note,
            symptom: symptom ?? this.symptom,
            prescription: prescription ?? this.prescription,
            reExaminationDate: reExaminationDate ?? this.reExaminationDate,
            appointmentId: appointmentId ?? this.appointmentId,
            id: id ?? this.id,
            isActive: isActive ?? this.isActive,
            createdAt: createdAt ?? this.createdAt,
        );

    factory MedicalRecord.fromJson(Map<String, dynamic> json) => MedicalRecord(
        patientProfileId: json["patientProfileId"],
        patientCode: json["patientCode"],
        biologicalGender: json["biologicalGender"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        phoneNumber: json["phoneNumber"],
        height: json["height"],
        weight: json["weight"],
        appoinmentType: json["appoinmentType"],
        doctorName: json["doctorName"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        room: json["room"],
        clinicName: json["clinicName"],
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        slotNumber: json["slotNumber"],
        note: json["note"],
        symptom: json["symptom"],
        prescription: json["prescription"],
        reExaminationDate: json["reExaminationDate"],
        appointmentId: json["appointmentId"],
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "patientProfileId": patientProfileId,
        "patientCode": patientCode,
        "biologicalGender": biologicalGender,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "phoneNumber": phoneNumber,
        "height": height,
        "weight": weight,
        "appoinmentType": appoinmentType,
        "doctorName": doctorName,
        "medicalSpecialtyName": medicalSpecialtyName,
        "room": room,
        "clinicName": clinicName,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "slotNumber": slotNumber,
        "note": note,
        "symptom": symptom,
        "prescription": prescription,
        "reExaminationDate": reExaminationDate,
        "appointmentId": appointmentId,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
    };
}
