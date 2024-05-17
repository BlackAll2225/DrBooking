import 'package:drbooking/app/model/service/button_service.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

const listTime = [
  '8:00 - 10:00',
  '10:00 - 12:00',
  '13:00 - 15:00',
  '15:00 - 17:00'
];

const listStatus = [
  "Đã đăng kí",
  "Đang diễn ra",
  "Kết thúc",
  "Đã huỷ",
  "Đang xử lý"
];

class Gender {
  int id;
  String name;
  Gender({required this.id, required this.name});
}

List<Gender> listGender = [
  Gender(id: 0, name: 'Nam'),
  Gender(id: 1, name: 'Nữ'),
  Gender(id: 2, name: 'Khác'),
];

List<AppointmentType> appointmentTypeList = [
  AppointmentType(
    label: 'Xét Nghiệm',
    color: Colors.green,
  ),
  AppointmentType(label: 'Theo yêu cầu', color: Colors.green),
  AppointmentType(label: 'Chuyên khoa', color: Colors.green),
  AppointmentType(label: 'Tái khám', color: Colors.green),
  AppointmentType(label: 'Tâm lý', color: Colors.green),
  AppointmentType(label: 'Vaccin', color: Colors.green),
    AppointmentType(label: 'Tổng quát', color: Colors.green),
];

enum TypeService {
  generalExam,
  specialtyExam,
  labExam,
  psychological,
  vaccination,
  reExam
}

class UtilCommon {
  static void snackBar({required String text, bool isFail = false}) {
    Get.snackbar('Thông báo', text,
        colorText: Colors.white,
        backgroundColor: isFail ? Colors.red : Colors.green);
  }

  static String convertDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String convertEEEDateTime(DateTime date) {
    return DateFormat('EEEE, dd MMMM yyyy', 'vi_VN').format(date);
  }

  static int getEnumAppointmentType(TypeService type) {
    switch (type) {
      case TypeService.vaccination:
        return 5;
      case TypeService.psychological:
        return 4;
      case TypeService.reExam:
        return 3;
      case TypeService.specialtyExam:
        return 2;
      case TypeService.labExam:
        return 0;
      default: return -1;
    }
  }
}

class UtilValidation {}
