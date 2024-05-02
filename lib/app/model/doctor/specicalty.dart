// To parse this JSON data, do
//
//     final specialty = specialtyFromJson(jsonString);

import 'dart:convert';

Specialty specialtyFromJson(String str) => Specialty.fromJson(json.decode(str));

String specialtyToJson(Specialty data) => json.encode(data.toJson());

class Specialty {
    String? id;
    String? name;
    String? imageUrl;

    Specialty({
        this.id,
        this.name,
        this.imageUrl,
    });

    Specialty copyWith({
        String? id,
        String? name,
        String? imageUrl,
    }) => 
        Specialty(
            id: id ?? this.id,
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
        );

    factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
    };
}
