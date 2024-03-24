// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    String email;
    String phoneNumber;
    String fullname;
    DateTime dateOfBirth;
    int height;
    int weight;
    String avatarUrl;
    int biologicalGender;
    String clientId;
    String addressId;
    String patientCode;
    String id;
    bool isActive;
    DateTime createdAt;

    Profile({
        required this.email,
        required this.phoneNumber,
        required this.fullname,
        required this.dateOfBirth,
        required this.height,
        required this.weight,
        required this.avatarUrl,
        required this.biologicalGender,
        required this.clientId,
        required this.addressId,
        required this.patientCode,
        required this.id,
        required this.isActive,
        required this.createdAt,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]??'1999-01-01'),
        height: json["height"]?? 0,
        weight: json["weight"]?? 0,
        avatarUrl: json["avatarUrl"],
        biologicalGender: json["biologicalGender"],
        clientId: json["clientId"],
        addressId: json["addressId"],
        patientCode: json["patientCode"],
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "height": height,
        "weight": weight,
        "avatarUrl": avatarUrl,
        "biologicalGender": biologicalGender,
        "clientId": clientId,
        "addressId": addressId,
        "patientCode": patientCode,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
    };
}
