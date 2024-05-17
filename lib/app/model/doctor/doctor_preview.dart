// To parse this JSON data, do
//
//     final doctorPreview = doctorPreviewFromJson(jsonString);

import 'dart:convert';

DoctorPreview doctorPreviewFromJson(String str) => DoctorPreview.fromJson(json.decode(str));

String doctorPreviewToJson(DoctorPreview data) => json.encode(data.toJson());

class DoctorPreview {
    String? id;
    String? email;
    String? fullname;
    String? degree;
    bool? isPartTime;
    String? clinicName;
    String? medicalSpecialtyName;
    String? avatarUrl;
    double? rating;
    int? yearOfExperience;

    DoctorPreview({
        this.id,
        this.email,
        this.fullname = 'Mặc định',
        this.degree,
        this.isPartTime,
        this.clinicName,
        this.medicalSpecialtyName,
        this.avatarUrl,
        this.rating,
        this.yearOfExperience,
    });

    DoctorPreview copyWith({
        String? id,
        String? email,
        String? fullname,
        String? degree,
        bool? isPartTime,
        String? clinicName,
        String? medicalSpecialtyName,
        String? avatarUrl,
        double? rating,
        int? yearOfExperience,
    }) => 
        DoctorPreview(
            id: id ?? this.id,
            email: email ?? this.email,
            fullname: fullname ?? this.fullname,
            degree: degree ?? this.degree,
            isPartTime: isPartTime ?? this.isPartTime,
            clinicName: clinicName ?? this.clinicName,
            medicalSpecialtyName: medicalSpecialtyName ?? this.medicalSpecialtyName,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            rating: rating ?? this.rating,
            yearOfExperience: yearOfExperience ?? this.yearOfExperience,
        );

    factory DoctorPreview.fromJson(Map<String, dynamic> json) => DoctorPreview(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        degree: json["degree"],
        isPartTime: json["isPartTime"],
        clinicName: json["clinicName"],
        medicalSpecialtyName: json["medicalSpecialtyName"],
        avatarUrl: json["avatarUrl"],
        rating: json["rating"].toDouble(),
        yearOfExperience: json["yearOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "degree": degree,
        "isPartTime": isPartTime,
        "clinicName": clinicName,
        "medicalSpecialtyName": medicalSpecialtyName,
        "avatarUrl": avatarUrl,
        "rating": rating,
        "yearOfExperience": yearOfExperience,
    };
}
