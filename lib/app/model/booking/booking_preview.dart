// To parse this JSON data, do
//
//     final appointmentPreview = appointmentPreviewFromJson(jsonString);

import 'dart:convert';

AppointmentPreview appointmentPreviewFromJson(String str) => AppointmentPreview.fromJson(json.decode(str));

String appointmentPreviewToJson(AppointmentPreview data) => json.encode(data.toJson());

class AppointmentPreview {
    String? id;
    String? doctorName;
    String? start;
    String? clinicName;
    String? end;
    int? appointmentStatus;
    int? appoinmentType;

    AppointmentPreview({
        this.id,
        this.doctorName,
        this.start,
        this.clinicName,
        this.end,
        this.appointmentStatus,
        this.appoinmentType,
    });

    AppointmentPreview copyWith({
        String? id,
        String? doctorName,
        String? start,
        String? clinicName,
        String? end,
        int? appointmentStatus,
        int? appoinmentType,
    }) => 
        AppointmentPreview(
            id: id ?? this.id,
            doctorName: doctorName ?? this.doctorName,
            start: start ?? this.start,
            clinicName: clinicName ?? this.clinicName,
            end: end ?? this.end,
            appointmentStatus: appointmentStatus ?? this.appointmentStatus,
            appoinmentType: appoinmentType ?? this.appoinmentType,
        );

    factory AppointmentPreview.fromJson(Map<String, dynamic> json) => AppointmentPreview(
        id: json["idAppointment"],
        doctorName: json["doctorName"],
        start: json["start"],
        clinicName: json["clinicName"],
        end: json["end"],
        appointmentStatus: json["appointmentStatus"],
        appoinmentType: json["appoinmentType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctorName": doctorName,
        "start": start,
        "clinicName": clinicName,
        "end": end,
        "appointmentStatus": appointmentStatus,
        "appoinmentType": appoinmentType,
    };
}
