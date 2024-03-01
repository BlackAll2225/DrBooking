import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class UtilNoti {
  static void snackFail({required String text, bool isFail = false}) {
    Get.snackbar('Thông báo', text,
        colorText: Colors.white,
        backgroundColor: isFail ? Colors.red : Colors.green);
  }
}
