// To parse this JSON data, do
//
//     final bookingPreview = bookingPreviewFromJson(jsonString);

import 'dart:convert';

BookingPreview bookingPreviewFromJson(String str) => BookingPreview.fromJson(json.decode(str));

String bookingPreviewToJson(BookingPreview data) => json.encode(data.toJson());

class BookingPreview {
    String id;
    String time;
    String date;
    String name;
    String branch;
    bool isNew;

    BookingPreview({
         this.id = "",
        required this.time,
        required this.date,
        required this.name,
        required this.branch,
        required this.isNew,
    });

    factory BookingPreview.fromJson(Map<String, dynamic> json) => BookingPreview(
        id: json["id"],
        time: json["time"],
        date: json["date"],
        name: json["name"],
        branch: json["branch"],
        isNew: json["isNew"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "date": date,
        "name": name,
        "branch": branch,
        "isNew": isNew,
    };
}
