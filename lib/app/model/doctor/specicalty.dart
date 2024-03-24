// To parse this JSON data, do
//
//     final specialty = specialtyFromJson(jsonString);

import 'dart:convert';

Specialty specialtyFromJson(String str) => Specialty.fromJson(json.decode(str));

String specialtyToJson(Specialty data) => json.encode(data.toJson());

class Specialty {
    String name;
    String imageUrl;
    String id;
    bool isActive;
    DateTime createdAt;

    Specialty({
         this.name = '',
         this.imageUrl = '',
         this.id = '',
         this.isActive = false,
required this.createdAt,
    });

    Specialty copyWith({
        String? name,
        String? imageUrl,
        String? id,
        bool? isActive,
        DateTime? createdAt,
    }) => 
        Specialty(
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            id: id ?? this.id,
            isActive: isActive ?? this.isActive,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        name: json["name"],
        imageUrl: json["imageUrl"],
        id: json["id"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
    };
}
