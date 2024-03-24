// To parse this JSON data, do
//
//     final accountSession = accountSessionFromJson(jsonString);

import 'dart:convert';

AccountSession accountSessionFromJson(String str) => AccountSession.fromJson(json.decode(str));

String accountSessionToJson(AccountSession data) => json.encode(data.toJson());

class AccountSession {
    String clientId;
    String fullName;
    String phoneNumber;
    String email;
    String role;
    int nbf;
    int exp;
    int iat;

    AccountSession({
        required this.clientId,
        required this.fullName,
        required this.phoneNumber,
        required this.email,
        required this.role,
        required this.nbf,
        required this.exp,
        required this.iat,
    });

    factory AccountSession.fromJson(Map<String, dynamic> json) => AccountSession(
        clientId: json["ClientId"],
        fullName: json["FullName"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        role: json["role"],
        nbf: json["nbf"],
        exp: json["exp"],
        iat: json["iat"],
    );

    Map<String, dynamic> toJson() => {
        "ClientId": clientId,
        "FullName": fullName,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "role": role,
        "nbf": nbf,
        "exp": exp,
        "iat": iat,
    };
}
