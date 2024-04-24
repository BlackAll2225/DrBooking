// To parse this JSON data, do
//
//     final loginPayload = loginPayloadFromJson(jsonString);

import 'dart:convert';

LoginPayload loginPayloadFromJson(String str) => LoginPayload.fromJson(json.decode(str));

String loginPayloadToJson(LoginPayload data) => json.encode(data.toJson());

class LoginPayload {
    String? phoneNumber;
    String? password;

    LoginPayload({
        this.phoneNumber,
        this.password,
    });

    LoginPayload copyWith({
        String? phoneNumber,
        String? password,
    }) => 
        LoginPayload(
            phoneNumber: phoneNumber ?? this.phoneNumber,
            password: password ?? this.password,
        );

    factory LoginPayload.fromJson(Map<String, dynamic> json) => LoginPayload(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
    };
}
