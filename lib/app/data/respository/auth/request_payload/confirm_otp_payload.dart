// To parse this JSON data, do
//
//     final confirmOtpPayload = confirmOtpPayloadFromJson(jsonString);

import 'dart:convert';

ConfirmOtpPayload confirmOtpPayloadFromJson(String str) => ConfirmOtpPayload.fromJson(json.decode(str));

String confirmOtpPayloadToJson(ConfirmOtpPayload data) => json.encode(data.toJson());

class ConfirmOtpPayload {
    String? otp;
    String? deviceToken;

    ConfirmOtpPayload({
        this.otp,
        this.deviceToken,
    });

    ConfirmOtpPayload copyWith({
        String? otp,
        String? deviceToken,
    }) => 
        ConfirmOtpPayload(
            otp: otp ?? this.otp,
            deviceToken: deviceToken ?? this.deviceToken,
        );

    factory ConfirmOtpPayload.fromJson(Map<String, dynamic> json) => ConfirmOtpPayload(
        otp: json["otp"],
        deviceToken: json["deviceToken"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "deviceToken": deviceToken,
    };
}
