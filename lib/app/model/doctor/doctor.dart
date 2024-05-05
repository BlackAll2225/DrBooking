// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
    String id;
    String email;
    String fullname;
    String degree;
    bool isPartTime;
    String medicalSpecialtyName;
    String avatarUrl;
    double rating;
    int yearOfExperience;

    factory Doctor.emptyFactory() {
    return Doctor(id: "", email: "email", fullname: "Mặc định", degree: "degree", isPartTime:false, medicalSpecialtyName: "medicalSpecialtyName", avatarUrl: "avatarUrl", rating: 4, yearOfExperience: 4);
    }
    Doctor({
        required this.id,
        required this.email,
        required this.fullname,
        required this.degree,
        required this.isPartTime,
        required this.medicalSpecialtyName,
        required this.avatarUrl,
        required this.rating,
        required this.yearOfExperience
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        degree: json["degree"]??'',
        isPartTime: json["isPartTime"],
        medicalSpecialtyName: json["medicalSpecialtyName"] ?? '',
        avatarUrl: json["avatarUrl"]??'',
        rating: json["rating"]?.toDouble(),
        yearOfExperience: json["yearOfExperience"].toInt()
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "degree": degree,
        "isPartTime": isPartTime,
        "medicalSpecialtyName": medicalSpecialtyName,
        "avatarUrl": avatarUrl,
        "rating": rating,
        "yearOfExperience": yearOfExperience
    };
}
