// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
    String? patientId;
    String? phoneNumber;
    String? fullname;
    DateTime? dateOfBirth;
    String? clientId;
    int? height;
    int? weight;
    String? avatarUrl;
    int? biologicalGender;
    String? patientCode;
    String? healthInsuranceCode;
    String? expiredDate;
    String? hiIssuedPlace;
    String? idCode;
    String? idIssuedDate;
    String? idIssuedPlace;
    String? addressLine;
    String? street;
    String? ward;
    String? district;
    String? province;

    Patient({
        this.patientId,
        this.phoneNumber,
        this.fullname,
        this.dateOfBirth,
        this.clientId,
        this.height,
        this.weight,
        this.avatarUrl,
        this.biologicalGender,
        this.patientCode,
        this.healthInsuranceCode,
        this.expiredDate,
        this.hiIssuedPlace,
        this.idCode,
        this.idIssuedDate,
        this.idIssuedPlace,
        this.addressLine,
        this.street,
        this.ward,
        this.district,
        this.province,
    });

    Patient copyWith({
        String? patientId,
        String? phoneNumber,
        String? fullname,
        DateTime? dateOfBirth,
        String? clientId,
        int? height,
        int? weight,
        String? avatarUrl,
        int? biologicalGender,
        String? patientCode,
        String? healthInsuranceCode,
        String? expiredDate,
        String? hiIssuedPlace,
        String? idCode,
        String? idIssuedDate,
        String? idIssuedPlace,
        String? addressLine,
        String? street,
        String? ward,
        String? district,
        String? province,
    }) => 
        Patient(
            patientId: patientId ?? this.patientId,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            fullname: fullname ?? this.fullname,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            clientId: clientId ?? this.clientId,
            height: height ?? this.height,
            weight: weight ?? this.weight,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            patientCode: patientCode ?? this.patientCode,
            healthInsuranceCode: healthInsuranceCode ?? this.healthInsuranceCode,
            expiredDate: expiredDate ?? this.expiredDate,
            hiIssuedPlace: hiIssuedPlace ?? this.hiIssuedPlace,
            idCode: idCode ?? this.idCode,
            idIssuedDate: idIssuedDate ?? this.idIssuedDate,
            idIssuedPlace: idIssuedPlace ?? this.idIssuedPlace,
            addressLine: addressLine ?? this.addressLine,
            street: street ?? this.street,
            ward: ward ?? this.ward,
            district: district ?? this.district,
            province: province ?? this.province,
        );

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientId: json["patientId"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        clientId: json["clientId"],
        height: json["height"],
        weight: json["weight"],
        avatarUrl: json["avatarUrl"],
        biologicalGender: json["biologicalGender"],
        patientCode: json["patientCode"],
        healthInsuranceCode: json["healthInsuranceCode"],
        expiredDate: json["expiredDate"],
        hiIssuedPlace: json["hiIssuedPlace"],
        idCode: json["idCode"],
        idIssuedDate: json["idIssuedDate"],
        idIssuedPlace: json["idIssuedPlace"],
        addressLine: json["addressLine"],
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
    );

    Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "clientId": clientId,
        "height": height,
        "weight": weight,
        "avatarUrl": avatarUrl,
        "biologicalGender": biologicalGender,
        "patientCode": patientCode,
        "healthInsuranceCode": healthInsuranceCode,
        "expiredDate": expiredDate,
        "hiIssuedPlace": hiIssuedPlace,
        "idCode": idCode,
        "idIssuedDate": idIssuedDate,
        "idIssuedPlace": idIssuedPlace,
        "addressLine": addressLine,
        "street": street,
        "ward": ward,
        "district": district,
        "province": province,
    };
}
