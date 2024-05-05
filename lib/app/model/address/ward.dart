// To parse this JSON data, do
//
//     final ward = wardFromJson(jsonString);

import 'dart:convert';

Ward wardFromJson(String str) => Ward.fromJson(json.decode(str));

String wardToJson(Ward data) => json.encode(data.toJson());

class Ward {
    String? wardCode;
    int? districtId;
    String? wardName;

    Ward({
        this.wardCode,
        this.districtId,
        this.wardName,
    });

    Ward copyWith({
        String? wardCode,
        int? districtId,
        String? wardName,
    }) => 
        Ward(
            wardCode: wardCode ?? this.wardCode,
            districtId: districtId ?? this.districtId,
            wardName: wardName ?? this.wardName,
        );

    factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        wardCode: json["WardCode"],
        districtId: json["DistrictID"],
        wardName: json["WardName"],
    );

    Map<String, dynamic> toJson() => {
        "WardCode": wardCode,
        "DistrictID": districtId,
        "WardName": wardName,
    };
}
