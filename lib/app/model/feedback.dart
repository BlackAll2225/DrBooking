// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

class Feedback {
    String? id;
    String? createdAt;
    String? doctorId;
    String? doctorName;
    String? patientProfileId;
    String? patientProfileName;
    int? rating;
    String? feedback;

    Feedback({
        this.id,
        this.createdAt,
        this.doctorId,
        this.doctorName,
        this.patientProfileId,
        this.patientProfileName,
        this.rating,
        this.feedback,
    });

    Feedback copyWith({
        String? id,
        String? createdAt,
        String? doctorId,
        String? doctorName,
        String? patientProfileId,
        String? patientProfileName,
        int? rating,
        String? feedback,
    }) => 
        Feedback(
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            doctorId: doctorId ?? this.doctorId,
            doctorName: doctorName ?? this.doctorName,
            patientProfileId: patientProfileId ?? this.patientProfileId,
            patientProfileName: patientProfileName ?? this.patientProfileName,
            rating: rating ?? this.rating,
            feedback: feedback ?? this.feedback,
        );

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        createdAt: json["createdAt"],
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        patientProfileId: json["patientProfileId"],
        patientProfileName: json["patientProfileName"],
        rating: json["rating"],
        feedback: json["feedback"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "patientProfileId": patientProfileId,
        "patientProfileName": patientProfileName,
        "rating": rating,
        "feedback": feedback,
    };
}
