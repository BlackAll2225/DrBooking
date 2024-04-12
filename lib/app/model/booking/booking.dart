// To parse this JSON data, do
//
//     final appointmentDetail = appointmentDetailFromJson(jsonString);

import 'dart:convert';

AppointmentDetail appointmentDetailFromJson(String str) => AppointmentDetail.fromJson(json.decode(str));

String appointmentDetailToJson(AppointmentDetail data) => json.encode(data.toJson());

class AppointmentDetail {
    String? note;
    String? roomName;
    String? symptom;
    String? patientProfileId;
    String? idAppointment;
    String? dutyScheduleId;
    String? start;
    String? clinicName;
    String? end;
    String? patientName;
    int? numericalOrder;
    String? doctorName;
    int? appointmentStatus;
    DateTime? dateOfBirth;
    int? biologicalGender;
    String? medicalServiceName;
    String? patientCode;
    String? medicalSpecialtyName;
    int? paymentStatus;
    String? paymentTransactionId;
    int? appoinmentType;

    AppointmentDetail({
        this.note,
        this.roomName,
        this.symptom,
        this.patientProfileId,
        this.idAppointment,
        this.dutyScheduleId,
        this.start,
        this.clinicName,
        this.end,
        this.patientName,
        this.numericalOrder,
        this.doctorName,
        this.appointmentStatus,
        this.dateOfBirth,
        this.biologicalGender,
        this.medicalServiceName,
        this.patientCode,
        this.medicalSpecialtyName,
        this.paymentStatus,
        this.paymentTransactionId,
        this.appoinmentType,
    });

    AppointmentDetail copyWith({
        String? note,
        String? roomName,
        String? symptom,
        String? patientProfileId,
        String? idAppointment,
        String? dutyScheduleId,
        String? start,
        String? clinicName,
        String? end,
        String? patientName,
        int? numericalOrder,
        String? doctorName,
        int? appointmentStatus,
        DateTime? dateOfBirth,
        int? biologicalGender,
        String? medicalServiceName,
        String? patientCode,
        String? medicalSpecialtyName,
        int? paymentStatus,
        String? paymentTransactionId,
        int? appoinmentType,
    }) => 
        AppointmentDetail(
            note: note ?? this.note,
            roomName: roomName ?? this.roomName,
            symptom: symptom ?? this.symptom,
            patientProfileId: patientProfileId ?? this.patientProfileId,
            idAppointment: idAppointment ?? this.idAppointment,
            dutyScheduleId: dutyScheduleId ?? this.dutyScheduleId,
            start: start ?? this.start,
            clinicName: clinicName ?? this.clinicName,
            end: end ?? this.end,
            patientName: patientName ?? this.patientName,
            numericalOrder: numericalOrder ?? this.numericalOrder,
            doctorName: doctorName ?? this.doctorName,
            appointmentStatus: appointmentStatus ?? this.appointmentStatus,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            medicalServiceName: medicalServiceName ?? this.medicalServiceName,
            patientCode: patientCode ?? this.patientCode,
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            paymentStatus: paymentStatus ?? this.paymentStatus,
            paymentTransactionId: paymentTransactionId ?? this.paymentTransactionId,
            appoinmentType: appoinmentType ?? this.appoinmentType,
        );

    factory AppointmentDetail.fromJson(Map<String, dynamic> json) => AppointmentDetail(
        note: json["note"],
        roomName: json["roomName"],
        symptom: json["symptom"],
        patientProfileId: json["patientProfileId"],
        idAppointment: json["idAppointment"],
        dutyScheduleId: json["dutyScheduleId"],
        start: json["start"],
        clinicName: json["clinicName"],
        end: json["end"],
        patientName: json["patientName"],
        numericalOrder: json["numericalOrder"],
        doctorName: json["doctorName"],
        appointmentStatus: json["appointmentStatus"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        biologicalGender: json["biologicalGender"],
        medicalServiceName: json["medicalServiceName"],
        patientCode: json["patientCode"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        paymentStatus: json["paymentStatus"],
        paymentTransactionId: json["paymentTransactionId"],
        appoinmentType: json["appoinmentType"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "roomName": roomName,
        "symptom": symptom,
        "patientProfileId": patientProfileId,
        "idAppointment": idAppointment,
        "dutyScheduleId": dutyScheduleId,
        "start": start,
        "clinicName": clinicName,
        "end": end,
        "patientName": patientName,
        "numericalOrder": numericalOrder,
        "doctorName": doctorName,
        "appointmentStatus": appointmentStatus,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "biologicalGender": biologicalGender,
        "medicalServiceName": medicalServiceName,
        "patientCode": patientCode,
        "medicalSpecialtyName": medicalSpecialtyName,
        "paymentStatus": paymentStatus,
        "paymentTransactionId": paymentTransactionId,
        "appoinmentType": appoinmentType,
    };
}
