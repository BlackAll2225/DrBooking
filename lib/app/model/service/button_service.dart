import 'dart:ui';

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

enum TypeService {
  generalExam,
  specialtyExam,
  labExam,
  psychological,
  vaccination
}

class AppointmentType {
  String label;
  Color color;
  AppointmentType({required this.label, required this.color});
}

List<AppointmentType> appointmentTypeList = [
  AppointmentType(label: 'Xét Nghiệm', color: Colors.green),
  AppointmentType(label: 'Theo yêu cầu', color: Colors.green),
  AppointmentType(label: 'Chuyên khoa', color: Colors.green),
  AppointmentType(label: 'Tái khám', color: Colors.green),
  AppointmentType(label: 'Tâm lý', color: Colors.green),
  AppointmentType(label: 'Vaccin', color: Colors.green),
];
