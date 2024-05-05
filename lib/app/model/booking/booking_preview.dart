// To parse this JSON data, do
//
//     final appointmentPreview = appointmentPreviewFromJson(jsonString);

import 'dart:convert';

AppointmentPreview appointmentPreviewFromJson(String str) => AppointmentPreview.fromJson(json.decode(str));

String appointmentPreviewToJson(AppointmentPreview data) => json.encode(data.toJson());

class AppointmentPreview {
    String? patientName;
    String? idPatientProfile;
    String? idAppointment;
    String? doctorName;
    String? start;
    String? end;
    int? slotNumber;
    String? clinicName;
    int? appointmentStatus;
    int? appoinmentType;
    int? paymentStatus;

    AppointmentPreview({
        this.patientName,
        this.idPatientProfile,
        this.idAppointment,
        this.doctorName,
        this.start,
        this.end,
        this.slotNumber,
        this.clinicName,
        this.appointmentStatus,
        this.appoinmentType,
        this.paymentStatus,
    });

    AppointmentPreview copyWith({
        String? patientName,
        String? idPatientProfile,
        String? idAppointment,
        String? doctorName,
        String? start,
        String? end,
        int? slotNumber,
        String? clinicName,
        int? appointmentStatus,
        int? appoinmentType,
        int? paymentStatus,
    }) => 
        AppointmentPreview(
            patientName: patientName ?? this.patientName,
            idPatientProfile: idPatientProfile ?? this.idPatientProfile,
            idAppointment: idAppointment ?? this.idAppointment,
            doctorName: doctorName ?? this.doctorName,
            start: start ?? this.start,
            end: end ?? this.end,
            slotNumber: slotNumber ?? this.slotNumber,
            clinicName: clinicName ?? this.clinicName,
            appointmentStatus: appointmentStatus ?? this.appointmentStatus,
            appoinmentType: appoinmentType ?? this.appoinmentType,
            paymentStatus: paymentStatus ?? this.paymentStatus,
        );

    factory AppointmentPreview.fromJson(Map<String, dynamic> json) => AppointmentPreview(
        patientName: json["patientName"],
        idPatientProfile: json["idPatientProfile"],
        idAppointment: json["idAppointment"],
        doctorName: json["doctorName"],
        start: json["start"],
        end: json["end"],
        slotNumber: json["slotNumber"],
        clinicName: json["clinicName"],
        appointmentStatus: json["appointmentStatus"],
        appoinmentType: json["appoinmentType"],
        paymentStatus: json["paymentStatus"],
    );

    Map<String, dynamic> toJson() => {
        "patientName": patientName,
        "idPatientProfile": idPatientProfile,
        "idAppointment": idAppointment,
        "doctorName": doctorName,
        "start": start,
        "end": end,
        "slotNumber": slotNumber,
        "clinicName": clinicName,
        "appointmentStatus": appointmentStatus,
        "appoinmentType": appoinmentType,
        "paymentStatus": paymentStatus,
    };
}
