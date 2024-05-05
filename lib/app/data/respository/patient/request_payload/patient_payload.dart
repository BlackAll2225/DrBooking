// To parse this JSON data, do
//
//     final patientPayload = patientPayloadFromJson(jsonString);

import 'dart:convert';

PatientPayload patientPayloadFromJson(String str) => PatientPayload.fromJson(json.decode(str));

String patientPayloadToJson(PatientPayload data) => json.encode(data.toJson());

class PatientPayload {
    String? patientId;
    String? phoneNumber;
    String? fullname;
    String? dateOfBirth;
    int? height;
    int? weight;
    int? biologicalGender;
    String? addressLine;
    String? street;
    String? ward;
    String? district;
    String? province;
    String? healthInsuranceCode;
    String? expiredDate;
    String? hiIssuedPlace;
    String? idCode;
    String? idIssuedDate;
    String? idIssuedPlace;

    PatientPayload({
        this.patientId,
        this.phoneNumber,
        this.fullname,
        this.dateOfBirth,
        this.height,
        this.weight,
        this.biologicalGender,
        this.addressLine,
        this.street,
        this.ward,
        this.district,
        this.province,
        this.healthInsuranceCode,
        this.expiredDate,
        this.hiIssuedPlace,
        this.idCode,
        this.idIssuedDate,
        this.idIssuedPlace,
    });

    PatientPayload copyWith({
        String? patientId,
        String? phoneNumber,
        String? fullname,
        String? dateOfBirth,
        int? height,
        int? weight,
        int? biologicalGender,
        String? addressLine,
        String? street,
        String? ward,
        String? district,
        String? province,
        String? healthInsuranceCode,
        String? expiredDate,
        String? hiIssuedPlace,
        String? idCode,
        String? idIssuedDate,
        String? idIssuedPlace,
    }) => 
        PatientPayload(
            patientId: patientId ?? this.patientId,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            fullname: fullname ?? this.fullname,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            height: height ?? this.height,
            weight: weight ?? this.weight,
            biologicalGender: biologicalGender ?? this.biologicalGender,
            addressLine: addressLine ?? this.addressLine,
            street: street ?? this.street,
            ward: ward ?? this.ward,
            district: district ?? this.district,
            province: province ?? this.province,
            healthInsuranceCode: healthInsuranceCode ?? this.healthInsuranceCode,
            expiredDate: expiredDate ?? this.expiredDate,
            hiIssuedPlace: hiIssuedPlace ?? this.hiIssuedPlace,
            idCode: idCode ?? this.idCode,
            idIssuedDate: idIssuedDate ?? this.idIssuedDate,
            idIssuedPlace: idIssuedPlace ?? this.idIssuedPlace,
        );

    factory PatientPayload.fromJson(Map<String, dynamic> json) => PatientPayload(
        patientId: json["patientId"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: json["dateOfBirth"],
        height: json["height"],
        weight: json["weight"],
        biologicalGender: json["biologicalGender"],
        addressLine: json["addressLine"],
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
        healthInsuranceCode: json["healthInsuranceCode"],
        expiredDate: json["expiredDate"],
        hiIssuedPlace: json["hiIssuedPlace"],
        idCode: json["idCode"],
        idIssuedDate: json["idIssuedDate"],
        idIssuedPlace: json["idIssuedPlace"],
    );

    Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth,
        "height": height,
        "weight": weight,
        "biologicalGender": biologicalGender,
        "addressLine": addressLine,
        "street": street,
        "ward": ward,
        "district": district,
        "province": province,
        "healthInsuranceCode": healthInsuranceCode,
        "expiredDate": expiredDate,
        "hiIssuedPlace": hiIssuedPlace,
        "idCode": idCode,
        "idIssuedDate": idIssuedDate,
        "idIssuedPlace": idIssuedPlace,
    };
}
