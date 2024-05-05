// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
    int? provinceId;
    String? provinceName;
    String? code;

    Province({
        this.provinceId,
        this.provinceName,
        this.code,
    });

    Province copyWith({
        int? provinceId,
        String? provinceName,
        String? code,
    }) => 
        Province(
            provinceId: provinceId ?? this.provinceId,
            provinceName: provinceName ?? this.provinceName,
            code: code ?? this.code,
        );

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceId: json["ProvinceID"],
        provinceName: json["ProvinceName"],
        code: json["Code"],
    );

    Map<String, dynamic> toJson() => {
        "ProvinceID": provinceId,
        "ProvinceName": provinceName,
        "Code": code,
    };
}
