// To parse this JSON data, do
//
//     final medicalRecord = medicalRecordFromJson(jsonString);

import 'dart:convert';

MedicalRecord medicalRecordFromJson(String str) => MedicalRecord.fromJson(json.decode(str));

String medicalRecordToJson(MedicalRecord data) => json.encode(data.toJson());

class MedicalRecord {
    String? patientCode;
    int? biologicalGender;
    String? dateOfBirth;
    int? appoinmentType;
    String? phoneNumber;
    int? weight;
    int? height;
    String? doctorName;
    String? medicalSpecialtyName;
    String? room;
    String? clinicName;
    String? startTime;
    String? endTime;
    int? slotNumber;
    String? note;
    String? symptom;
    String? prescription;
    String? reExaminationDate;

    MedicalRecord({
        this.patientCode,
        this.biologicalGender,
        this.dateOfBirth,
        this.appoinmentType,
        this.phoneNumber,
        this.weight,
        this.height,
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
    });

    MedicalRecord copyWith({
        String? patientCode,
        int? biologicalGender,
        String? dateOfBirth,
        int? appoinmentType,
        String? phoneNumber,
        int? weight,
        int? height,
        String? doctorName,
        String? medicalSpecialtyName,
        String? room,
        String? clinicName,
        String? startTime,
        String? endTime,
        int? slotNumber,
        String? note,
        String? symptom,
        String? prescription,
        String? reExaminationDate,
    }) => 
        MedicalRecord(
            patientCode: patientCode ?? this.patientCode,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            appoinmentType: appoinmentType ?? this.appoinmentType,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            weight: weight ?? this.weight,
            height: height ?? this.height,
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
        );

    factory MedicalRecord.fromJson(Map<String, dynamic> json) => MedicalRecord(
        patientCode: json["patientCode"],
        biologicalGender: json["biologicalGender"],
        dateOfBirth: json["dateOfBirth"],
        appoinmentType: json["appoinmentType"],
        phoneNumber: json["phoneNumber"],
        weight: json["weight"],
        height: json["height"],
        doctorName: json["doctorName"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        room: json["room"],
        clinicName: json["clinicName"],
        startTime: json["startTime"] ,
        endTime: json["endTime"],
        slotNumber: json["slotNumber"],
        note: json["note"],
        symptom: json["symptom"],
        prescription: json["prescription"],
        reExaminationDate: json["reExaminationDate"] ,
    );

    Map<String, dynamic> toJson() => {
        "patientCode": patientCode,
        "biologicalGender": biologicalGender,
        "dateOfBirth": dateOfBirth,
        "appoinmentType": appoinmentType,
        "phoneNumber": phoneNumber,
        "weight": weight,
        "height": height,
        "doctorName": doctorName,
        "medicalSpecialtyName": medicalSpecialtyName,
        "room": room,
        "clinicName": clinicName,
        "startTime": startTime,
        "endTime": endTime,
        "slotNumber": slotNumber,
        "note": note,
        "symptom": symptom,
        "prescription": prescription,
        "reExaminationDate": reExaminationDate,
    };
}
