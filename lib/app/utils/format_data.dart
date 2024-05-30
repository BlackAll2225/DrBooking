import 'dart:developer';

import 'package:intl/intl.dart';

class FormatDataCustom {
  static String convertDatetoFullDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    String result = DateFormat('EEEE dd/MM/yyyy', 'vi_VN').format(dateTime);
    return result;
  }
    static String mappingIso8ToSlot(String dateTimeString) {
    List<String> parts = dateTimeString.split("T");
    String timeString = parts.length > 1 ? parts[1] : "";
    log(timeString);
    List<String> timeParts = timeString.split(":");
    String hour = timeParts.isNotEmpty ? timeParts[0] : "";
    String minute = timeParts.length > 1 ? timeParts[1] : "";
    // Kết hợp giờ và phút
    return "$hour:$minute";
  }
}


class ValidationUtil {

  static String validationStringLimit(String value, int limit)=>
    value.length > limit ? 'Giới hạn số lượng kí tự $limit' : '';
}