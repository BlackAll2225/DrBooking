// To parse this JSON data, do
//
//     final appointmentDetail = appointmentDetailFromJson(jsonString);

import 'dart:convert';

AppointmentDetail appointmentDetailFromJson(String str) => AppointmentDetail.fromJson(json.decode(str));

String appointmentDetailToJson(AppointmentDetail data) => json.encode(data.toJson());

class AppointmentDetail {
    String? idAppointment;
    String? patientProfileId;
    DateTime? start;
    DateTime? end;
    int? slotNumber;
    int? numericalOrder;
    String? note;
    String? roomName;
    String? symptom;
    String? clinicName;
    String? patientName;
    String? doctorName;
    String? doctorId;
    DateTime? dateOfBirth;
    int? biologicalGender;
    dynamic medicalServiceName;
    dynamic patientCode;
    dynamic medicalSpecialtyName;
    String? paymentTransactionId;
    int? appoinmentType;
    int? appointmentStatus;
    int? paymentStatus;
    int? rating;
    String? review;

    AppointmentDetail({
        this.idAppointment,
        this.patientProfileId,
        this.start,
        this.end,
        this.slotNumber,
        this.numericalOrder,
        this.note,
        this.roomName,
        this.symptom,
        this.clinicName,
        this.patientName,
        this.doctorName,
        this.doctorId,
        this.dateOfBirth,
        this.biologicalGender,
        this.medicalServiceName,
        this.patientCode,
        this.medicalSpecialtyName,
        this.paymentTransactionId,
        this.appoinmentType,
        this.appointmentStatus,
        this.paymentStatus,
        this.rating = -1,
        this.review = ''
    });

    AppointmentDetail copyWith({
        String? idAppointment,
        String? patientProfileId,
        DateTime? start,
        DateTime? end,
        int? slotNumber,
        int? numericalOrder,
        String? note,
        String? roomName,
        String? symptom,
        String? clinicName,
        String? patientName,
        String? doctorName,
        String? doctorId,
        DateTime? dateOfBirth,
        int? biologicalGender,
        dynamic medicalServiceName,
        dynamic patientCode,
        dynamic medicalSpecialtyName,
        String? paymentTransactionId,
        int? appoinmentType,
        int? appointmentStatus,
        int? paymentStatus,
        bool? isReviewed = false,
        int? rating,
        String? review
    }) => 
        AppointmentDetail(
            idAppointment: idAppointment ?? this.idAppointment,
            patientProfileId: patientProfileId ?? this.patientProfileId,
            start: start ?? this.start,
            end: end ?? this.end,
            slotNumber: slotNumber ?? this.slotNumber,
            numericalOrder: numericalOrder ?? this.numericalOrder,
            note: note ?? this.note,
            roomName: roomName ?? this.roomName,
            symptom: symptom ?? this.symptom,
            clinicName: clinicName ?? this.clinicName,
            patientName: patientName ?? this.patientName,
            doctorName: doctorName ?? this.doctorName,
            doctorId: doctorId ?? this.doctorId,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            medicalServiceName: medicalServiceName ?? this.medicalServiceName,
            patientCode: patientCode ?? this.patientCode,
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            paymentTransactionId: paymentTransactionId ?? this.paymentTransactionId,
            appoinmentType: appoinmentType ?? this.appoinmentType,
            appointmentStatus: appointmentStatus ?? this.appointmentStatus,
            paymentStatus: paymentStatus ?? this.paymentStatus,
            rating: rating ?? -1,
            review: review ?? ''
        );

    factory AppointmentDetail.fromJson(Map<String, dynamic> json) => AppointmentDetail(
        idAppointment: json["idAppointment"],
        patientProfileId: json["patientProfileId"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        slotNumber: json["slotNumber"],
        numericalOrder: json["numericalOrder"],
        note: json["note"],
        roomName: json["roomName"],
        symptom: json["symptom"],
        clinicName: json["clinicName"],
        patientName: json["patientName"],
        doctorName: json["doctorName"],
        doctorId: json["doctorId"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        biologicalGender: json["biologicalGender"],
        medicalServiceName: json["medicalServiceName"],
        patientCode: json["patientCode"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        paymentTransactionId: json["paymentTransactionId"],
        appoinmentType: json["appoinmentType"],
        appointmentStatus: json["appointmentStatus"],
        paymentStatus: json["paymentStatus"],
        rating: json["rating"],
        review:  json["review"]
    );

    Map<String, dynamic> toJson() => {
        "idAppointment": idAppointment,
        "patientProfileId": patientProfileId,
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "slotNumber": slotNumber,
        "numericalOrder": numericalOrder,
        "note": note,
        "roomName": roomName,
        "symptom": symptom,
        "clinicName": clinicName,
        "patientName": patientName,
        "doctorName": doctorName,
        "doctorId": doctorId,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "biologicalGender": biologicalGender,
        "medicalServiceName": medicalServiceName,
        "patientCode": patientCode,
        "medicalSpecialtyName": medicalSpecialtyName,
        "paymentTransactionId": paymentTransactionId,
        "appoinmentType": appoinmentType,
        "appointmentStatus": appointmentStatus,
        "paymentStatus": paymentStatus,
    };
}
