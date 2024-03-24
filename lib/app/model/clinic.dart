
// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import 'dart:convert';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

class Clinic {
    String name;
    String addressLine;
    String street;
    String ward;
    String district;
    String province;
    double longtitude;
    double latitude;
    String id;
    bool isActive;
    DateTime createdAt;
    String fullAddress;
    String phoneNumber;

    Clinic({
         this.name = '',
         this.addressLine = '',
         this.street = '',
         this.ward = '',
         this.district = '',
         this.province = '',
         this.longtitude = 0,
         this.latitude = 0,
         this.id = '',
         this.isActive = false,
required this.createdAt ,
         this.fullAddress = '',
         this.phoneNumber = ''

    });

    factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        name: json["name"],
        addressLine: json["addressLine"],
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
        longtitude: double.tryParse(json["longtitude"])??0,
        latitude: double.tryParse(json["latitude"])??0,
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        fullAddress: json["addressLine"] + " " +  json["street"] + ", "+  json["ward"] + ", " + json["district"]+ ", " + json["province"],
        phoneNumber: json["phoneNumber"] ?? "Chưa cập nhật"
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "addressLine": addressLine,
        "street": street,
        "ward": ward,
        "district": district,
        "province": province,
        "longtitude": longtitude,
        "latitude": latitude,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
    };
}

