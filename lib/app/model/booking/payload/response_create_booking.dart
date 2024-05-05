// To parse this JSON data, do
//
//     final responseCreateBooking = responseCreateBookingFromJson(jsonString);

import 'dart:convert';

ResponseCreateBooking responseCreateBookingFromJson(String str) => ResponseCreateBooking.fromJson(json.decode(str));

String responseCreateBookingToJson(ResponseCreateBooking data) => json.encode(data.toJson());

class ResponseCreateBooking {
    String? paymentLink;

    ResponseCreateBooking({
        this.paymentLink,
    });

    ResponseCreateBooking copyWith({
        String? paymentLink,
    }) => 
        ResponseCreateBooking(
            paymentLink: paymentLink ?? this.paymentLink,
        );

    factory ResponseCreateBooking.fromJson(Map<String, dynamic> json) => ResponseCreateBooking(
        paymentLink: json["payment_link"],
    );
        factory ResponseCreateBooking.fromString(String data) => ResponseCreateBooking(
        paymentLink: data,
    );

    Map<String, dynamic> toJson() => {
        "payment_link": paymentLink,
    };
}
