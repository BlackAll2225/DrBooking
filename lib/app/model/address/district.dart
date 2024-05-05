// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

import 'dart:convert';

District districtFromJson(String str) => District.fromJson(json.decode(str));

String districtToJson(District data) => json.encode(data.toJson());

class District {
    int? districtId;
    int? provinceId;
    String? districtName;
    String? code;
    int? type;
    int? supportType;

    District({
        this.districtId,
        this.provinceId,
        this.districtName,
        this.code,
        this.type,
        this.supportType,
    });

    District copyWith({
        int? districtId,
        int? provinceId,
        String? districtName,
        String? code,
        int? type,
        int? supportType,
    }) => 
        District(
            districtId: districtId ?? this.districtId,
            provinceId: provinceId ?? this.provinceId,
            districtName: districtName ?? this.districtName,
            code: code ?? this.code,
            type: type ?? this.type,
            supportType: supportType ?? this.supportType,
        );

    factory District.fromJson(Map<String, dynamic> json) => District(
        districtId: json["DistrictID"],
        provinceId: json["ProvinceID"],
        districtName: json["DistrictName"],
        code: json["Code"],
        type: json["Type"],
        supportType: json["SupportType"],
    );

    Map<String, dynamic> toJson() => {
        "DistrictID": districtId,
        "ProvinceID": provinceId,
        "DistrictName": districtName,
        "Code": code,
        "Type": type,
        "SupportType": supportType,
    };
}
