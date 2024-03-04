import 'package:intl/intl.dart';

class FormatDataCustom {
  static String convertDatetoFullDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    String result = DateFormat('EEEE dd/MM/yyyy', 'vi_VN').format(dateTime);
    return result;
  }
}
