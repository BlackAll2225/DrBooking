import 'dart:ui';

import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';

class ButtonService {
  String content;
  String imageUrl;
  bool isService;
  TypeService type;
  String path;
  ButtonService(
      {required this.content,
      required this.imageUrl,
      required this.isService,
      required this.path,
      required this.type});

  factory ButtonService.fromJson(Map<String, dynamic> json) => ButtonService(
      path: json["path"],
      content: json["content"],
      imageUrl: json["imageUrl"],
      isService: bool.tryParse(json["isService"]) ?? false,
      type: json["type"]);
}



class AppointmentType {
  String label;
  Color color;
  AppointmentType({required this.label, required this.color});
}

