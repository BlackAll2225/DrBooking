// To parse this JSON data, do
//
//     final doctorPreview = doctorPreviewFromJson(jsonString);

import 'dart:convert';

DoctorPreview doctorPreviewFromJson(String str) => DoctorPreview.fromJson(json.decode(str));

String doctorPreviewToJson(DoctorPreview data) => json.encode(data.toJson());

class DoctorPreview {
    String id;
    String name;
    String special;
    String branch;
    double exp;
    double rate;
    int countReview;

    DoctorPreview({
        required this.id,
        required this.name,
        required this.special,
        required this.exp,
        required this.rate,
        required this.branch,
        required this.countReview,
    });

    factory DoctorPreview.fromJson(Map<String, dynamic> json) => DoctorPreview(
        id: json["id"],
        name: json["name"],
        branch: json["branch"],
        special: json["special"],
        exp: json["exp"]?.toDouble(),
        rate: json["rate"]?.toDouble(),
        countReview: json["countReview"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "special": special,
        "exp": exp,
        "rate": rate,
        "countReview": countReview,
    };
}
