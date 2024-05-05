// To parse this JSON data, do
//
//     final registerPayload = registerPayloadFromJson(jsonString);

import 'dart:convert';

RegisterPayload registerPayloadFromJson(String str) => RegisterPayload.fromJson(json.decode(str));

String registerPayloadToJson(RegisterPayload data) => json.encode(data.toJson());

class RegisterPayload {
    String? phoneNumber;
    String? email;
    String? password;
    String? fullName;

    RegisterPayload({
        this.phoneNumber,
        this.email,
        this.password,
        this.fullName,
    });

    RegisterPayload copyWith({
        String? phoneNumber,
        String? email,
        String? password,
        String? fullName,
    }) => 
        RegisterPayload(
            phoneNumber: phoneNumber ?? this.phoneNumber,
            email: email ?? this.email,
            password: password ?? this.password,
            fullName: fullName ?? this.fullName,
        );

    factory RegisterPayload.fromJson(Map<String, dynamic> json) => RegisterPayload(
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        fullName: json["fullName"],
    );

    Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "fullName": fullName,
    };
}
