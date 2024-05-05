// To parse this JSON data, do
//
//     final personalAccount = personalAccountFromJson(jsonString);

import 'dart:convert';

PersonalAccount personalAccountFromJson(String str) => PersonalAccount.fromJson(json.decode(str));

String personalAccountToJson(PersonalAccount data) => json.encode(data.toJson());

class PersonalAccount {
    String email;
    String passwordHash;
    String phoneNumber;
    String fullname;
    String avatarUrl;
    String id;
    bool isActive;
    DateTime createdAt;

    PersonalAccount({
        required this.email,
        required this.passwordHash,
        required this.phoneNumber,
        required this.fullname,
        required this.avatarUrl,
        required this.id,
        required this.isActive,
        required this.createdAt,
    });

    PersonalAccount copyWith({
        String? email,
        String? passwordHash,
        String? phoneNumber,
        String? fullname,
        String? avatarUrl,
        String? id,
        bool? isActive,
        DateTime? createdAt,
    }) => 
        PersonalAccount(
            email: email ?? this.email,
            passwordHash: passwordHash ?? this.passwordHash,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            fullname: fullname ?? this.fullname,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            id: id ?? this.id,
            isActive: isActive ?? this.isActive,
            createdAt: createdAt ?? this.createdAt,
        );
 factory PersonalAccount.emptyObject() => PersonalAccount(
        email: "",
        passwordHash: "",
        phoneNumber: "",
        fullname: "",
        avatarUrl: "",
        id: "",
        isActive: false,
        createdAt: DateTime.now(),
    );
    factory PersonalAccount.fromJson(Map<String, dynamic> json) => PersonalAccount(
        email: json["email"],
        passwordHash: json["passwordHash"],
        phoneNumber: json["phoneNumber"],
        fullname: json["fullname"],
        avatarUrl: json["avatarUrl"],
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "passwordHash": passwordHash,
        "phoneNumber": phoneNumber,
        "fullname": fullname,
        "avatarUrl": avatarUrl,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
    };
}
