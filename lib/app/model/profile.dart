// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    String? email;
    String? phoneNumber;
    String? fullname;
    DateTime? dateOfBirth;
    int? height;
    int? weight;
    String? avatarUrl;
    int? biologicalGender;
    String? clientId;
    String? addressId;
    String? patientCode;
    dynamic healthInsuranceCode;
    DateTime? expiredDate;
    String? hiIssuedPlace;
    String? idCode;
    DateTime? idIssuedDate;
    String? idIssuedPlace;
    String? id;
    bool? isActive;
    DateTime? createdAt;

    Profile({
        this.email,
        this.phoneNumber,
        this.fullname,
        this.dateOfBirth,
        this.height,
        this.weight,
        this.avatarUrl,
        this.biologicalGender,
        this.clientId,
        this.addressId,
        this.patientCode,
        this.healthInsuranceCode,
        this.expiredDate,
        this.hiIssuedPlace,
        this.idCode,
        this.idIssuedDate,
        this.idIssuedPlace,
        this.id,
        this.isActive,
        this.createdAt,
    });

    Profile copyWith({
        String? email,
        String? phoneNumber,
        String? fullname,
        DateTime? dateOfBirth,
        int? height,
        int? weight,
        String? avatarUrl,
        int? biologicalGender,
        String? clientId,
        String? addressId,
        String? patientCode,
        dynamic healthInsuranceCode,
        DateTime? expiredDate,
        String? hiIssuedPlace,
        String? idCode,
        DateTime? idIssuedDate,
        String? idIssuedPlace,
        String? id,
        bool? isActive,
        DateTime? createdAt,
    }) => 
        Profile(
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            fullname: fullname ?? this.fullname,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            height: height ?? this.height,
            weight: weight ?? this.weight,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            clientId: clientId ?? this.clientId,
            addressId: addressId ?? this.addressId,
            patientCode: patientCode ?? this.patientCode,
            healthInsuranceCode: healthInsuranceCode ?? this.healthInsuranceCode,
            expiredDate: expiredDate ?? this.expiredDate,
            hiIssuedPlace: hiIssuedPlace ?? this.hiIssuedPlace,
            idCode: idCode ?? this.idCode,
            idIssuedDate: idIssuedDate ?? this.idIssuedDate,
            idIssuedPlace: idIssuedPlace ?? this.idIssuedPlace,
            id: id ?? this.id,
            isActive: isActive ?? this.isActive,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        height: json["height"],
        weight: json["weight"],
        avatarUrl: json["avatarUrl"],
        biologicalGender: json["biologicalGender"],
        clientId: json["clientId"],
        addressId: json["addressId"],
        patientCode: json["patientCode"],
        healthInsuranceCode: json["healthInsuranceCode"],
        expiredDate: json["expiredDate"] == null ? null : DateTime.parse(json["expiredDate"]),
        hiIssuedPlace: json["hiIssuedPlace"],
        idCode: json["idCode"],
        idIssuedDate: json["idIssuedDate"] == null ? null : DateTime.parse(json["idIssuedDate"]),
        idIssuedPlace: json["idIssuedPlace"],
        id: json["id"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "height": height,
        "weight": weight,
        "avatarUrl": avatarUrl,
        "biologicalGender": biologicalGender,
        "clientId": clientId,
        "addressId": addressId,
        "patientCode": patientCode,
        "healthInsuranceCode": healthInsuranceCode,
        "expiredDate": expiredDate?.toIso8601String(),
        "hiIssuedPlace": hiIssuedPlace,
        "idCode": idCode,
        "idIssuedDate": idIssuedDate?.toIso8601String(),
        "idIssuedPlace": idIssuedPlace,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
    };
}
