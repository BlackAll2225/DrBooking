// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
    String? id;
    String? fullname;
    String? phoneNumber;
    String? degree;
    String? experience;
    String? yearOfExperience;
    String? education;
    String? specialtyName;
    String? avatarUrl;
    String? clinicName;
    String? description;
    String? employeeCode;
    String? email;
    int? biologicalGender;
    int? rating;
    DateTime? dateOfBirth;

    Doctor({
        this.id,
        this.fullname,
        this.phoneNumber,
        this.degree,
        this.experience,
        this.yearOfExperience,
        this.education,
        this.specialtyName,
        this.avatarUrl,
        this.clinicName,
        this.description,
        this.employeeCode,
        this.email,
        this.biologicalGender,
        this.rating,
        this.dateOfBirth,
    });

    Doctor copyWith({
        String? id,
        String? fullname,
        String? phoneNumber,
        String? degree,
        String? experience,
        String? yearOfExperience,
        String? education,
        String? specialtyName,
        String? avatarUrl,
        String? clinicName,
        String? description,
        String? employeeCode,
        String? email,
        int? biologicalGender,
        int? rating,
        DateTime? dateOfBirth,
    }) => 
        Doctor(
            id: id ?? this.id,
            fullname: fullname ?? this.fullname,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            degree: degree ?? this.degree,
            experience: experience ?? this.experience,
            yearOfExperience: yearOfExperience ?? this.yearOfExperience,
            education: education ?? this.education,
            specialtyName: specialtyName ?? this.specialtyName,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            clinicName: clinicName ?? this.clinicName,
            description: description ?? this.description,
            employeeCode: employeeCode ?? this.employeeCode,
            email: email ?? this.email,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            rating: rating ?? this.rating,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        );

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
        degree: json["degree"],
        experience: json["experience"],
        yearOfExperience: json["yearOfExperience"] == '0' ?'Chưa cập nhật' : json["yearOfExperience"] + ' năm',
        education: json["education"],
        specialtyName: json["specialtyName"],
        avatarUrl: json["avatarUrl"],
        clinicName: json["clinicName"],
        description: json["description"],
        employeeCode: json["employeeCode"],
        email: json["email"],
        biologicalGender: json["biologicalGender"],
        rating: json["rating"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "degree": degree,
        "experience": experience,
        "yearOfExperience": yearOfExperience,
        "education": education,
        "specialtyName": specialtyName,
        "avatarUrl": avatarUrl,
        "clinicName": clinicName,
        "description": description,
        "employeeCode": employeeCode,
        "email": email,
        "biologicalGender": biologicalGender,
        "rating": rating,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
    };
}
