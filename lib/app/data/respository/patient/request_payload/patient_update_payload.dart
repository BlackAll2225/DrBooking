// To parse this JSON data, do
//
//     final patientUpdatePayload = patientUpdatePayloadFromJson(jsonString);

import 'dart:convert';

PatientUpdatePayload patientUpdatePayloadFromJson(String str) => PatientUpdatePayload.fromJson(json.decode(str));

String patientUpdatePayloadToJson(PatientUpdatePayload data) => json.encode(data.toJson());

class PatientUpdatePayload {
    String? id;
    String? phoneNumber;
    int? height;
    int? weight;
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

    PatientUpdatePayload({
        this.id,
        this.phoneNumber,
        this.height,
        this.weight,
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

    PatientUpdatePayload copyWith({
        String? id,
        String? phoneNumber,
        int? height,
        int? weight,
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
        PatientUpdatePayload(
            id: id ?? this.id,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            height: height ?? this.height,
            weight: weight ?? this.weight,
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

    factory PatientUpdatePayload.fromJson(Map<String, dynamic> json) => PatientUpdatePayload(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        height: json["height"],
        weight: json["weight"],
        healthInsuranceCode: json["healthInsuranceCode"],
        expiredDate: json["expiredDate"] == null ? null :json["expiredDate"],
        hiIssuedPlace: json["hiIssuedPlace"],
        idCode: json["idCode"],
        idIssuedDate: json["idIssuedDate"] == null ? null : json["idIssuedDate"],
        idIssuedPlace: json["idIssuedPlace"],
        addressLine: json["addressLine"],
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "height": height,
        "weight": weight,
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
