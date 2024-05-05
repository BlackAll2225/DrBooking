// To parse this JSON data, do
//
//     final bodyRequestCreatePatient = bodyRequestCreatePatientFromJson(jsonString);

import 'dart:convert';

BodyRequestCreatePatient bodyRequestCreatePatientFromJson(String str) =>
    BodyRequestCreatePatient.fromJson(json.decode(str));

String bodyRequestCreatePatientToJson(BodyRequestCreatePatient data) =>
    json.encode(data.toJson());

class BodyRequestCreatePatient {
  String? email;
  String? phoneNumber;
  String? fullname;
  String? dateOfBirth;
  String? clientId;
  int? height;
  int? weight;
  String? avatarUrl;
  int? biologicalGender;
  String? patientCode;
  String? healthInsuranceCode;
  String? expiredDate;
  String? idCode;
  String? hiIssuedPlace;
  String? idIssuedDate;
  String? idIssuedPlace;
  bool? isActive;
  String? createdAt;
  String? addressLine;
  String? street;
  String? ward;
  String? district;
  String? province;

  BodyRequestCreatePatient({
    this.email,
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
    this.idCode,
    this.hiIssuedPlace,
    this.idIssuedDate,
    this.idIssuedPlace,
    this.isActive,
    this.createdAt,
    this.addressLine,
    this.street,
    this.ward,
    this.district,
    this.province,
  });

  BodyRequestCreatePatient copyWith({
    String? email,
    String? phoneNumber,
    String? fullname,
    String? dateOfBirth,
    String? clientId,
    int? height,
    int? weight,
    String? avatarUrl,
    int? biologicalGender,
    String? patientCode,
    String? healthInsuranceCode,
    String? expiredDate,
    String? idCode,
    String? hiIssuedPlace,
    String? idIssuedDate,
    String? idIssuedPlace,
    bool? isActive,
    String? createdAt,
    String? addressLine,
    String? street,
    String? ward,
    String? district,
    String? province,
  }) =>
      BodyRequestCreatePatient(
        email: email ?? this.email,
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
        idCode: idCode ?? this.idCode,
        hiIssuedPlace: hiIssuedPlace ?? this.hiIssuedPlace,
        idIssuedDate: idIssuedDate ?? this.idIssuedDate,
        idIssuedPlace: idIssuedPlace ?? this.idIssuedPlace,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        addressLine: addressLine ?? this.addressLine,
        street: street ?? this.street,
        ward: ward ?? this.ward,
        district: district ?? this.district,
        province: province ?? this.province,
      );

  factory BodyRequestCreatePatient.fromJson(Map<String, dynamic> json) =>
      BodyRequestCreatePatient(
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        dateOfBirth: json["dateOfBirth"],
        clientId: json["clientId"],
        height: json["height"],
        weight: json["weight"],
        avatarUrl: json["avatarUrl"],
        biologicalGender: json["biologicalGender"],
        patientCode: json["patientCode"],
        healthInsuranceCode: json["healthInsuranceCode"],
        expiredDate: json["expiredDate"],
        idCode: json["idCode"],
        hiIssuedPlace: json["hiIssuedPlace"],
        idIssuedDate: json["idIssuedDate"],
        idIssuedPlace: json["idIssuedPlace"],
        isActive: json["isActive"],
        createdAt: json["createdAt"],
        addressLine: json["addressLine"],
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "dateOfBirth": dateOfBirth,
        "clientId": clientId,
        "height": height,
        "weight": weight,
        "avatarUrl": avatarUrl,
        "biologicalGender": biologicalGender,
        "patientCode": patientCode,
        "healthInsuranceCode": healthInsuranceCode,
        "expiredDate": expiredDate,
        "idCode": idCode,
        "hiIssuedPlace": hiIssuedPlace,
        "idIssuedDate": idIssuedDate,
        "idIssuedPlace": idIssuedPlace,
        "isActive": isActive,
        "createdAt": createdAt,
        "addressLine": addressLine,
        "street": street,
        "ward": ward,
        "district": district,
        "province": province,
      };
}
