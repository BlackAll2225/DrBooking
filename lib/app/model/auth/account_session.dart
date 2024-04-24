// To parse this JSON data, do
//
//     final accountSession = accountSessionFromJson(jsonString);

import 'dart:convert';

AccountSession accountSessionFromJson(String str) => AccountSession.fromJson(json.decode(str));

String accountSessionToJson(AccountSession data) => json.encode(data.toJson());

class AccountSession {
    String? clientId;
    String? fullName;
    String? phoneNumber;
    String? email;
    String? isEmailConfirmed;
    String? avatarUrl;
    String? role;
    int? nbf;
    int? exp;
    int? iat;

    AccountSession({
        this.clientId,
        this.fullName,
        this.phoneNumber,
        this.email,
        this.isEmailConfirmed,
        this.avatarUrl,
        this.role,
        this.nbf,
        this.exp,
        this.iat,
    });

    AccountSession copyWith({
        String? clientId,
        String? fullName,
        String? phoneNumber,
        String? email,
        String? isEmailConfirmed,
        String? avatarUrl,
        String? role,
        int? nbf,
        int? exp,
        int? iat,
    }) => 
        AccountSession(
            clientId: clientId ?? this.clientId,
            fullName: fullName ?? this.fullName,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            email: email ?? this.email,
            isEmailConfirmed: isEmailConfirmed ?? this.isEmailConfirmed,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            role: role ?? this.role,
            nbf: nbf ?? this.nbf,
            exp: exp ?? this.exp,
            iat: iat ?? this.iat,
        );

    factory AccountSession.fromJson(Map<String, dynamic> json) => AccountSession(
        clientId: json["ClientId"],
        fullName: json["FullName"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        isEmailConfirmed: json["IsEmailConfirmed"],
        avatarUrl: json["AvatarUrl"],
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
        "IsEmailConfirmed": isEmailConfirmed,
        "AvatarUrl": avatarUrl,
        "role": role,
        "nbf": nbf,
        "exp": exp,
        "iat": iat,
    };
}
