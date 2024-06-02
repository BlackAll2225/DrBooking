import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static init() async {
    await _notification.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));
    tz.initializeTimeZones();
  }

  static scheduleNotifications(
      String title, String body, DateTime day, TimeOfDay time, int id) async {
    DateTime data = combineDateAndTime(day, time);
    var androidDetails = AndroidNotificationDetails(
        'importan_notifications', 'My Channel',
        importance: Importance.max, priority: Priority.high);

    var notificationDetails = NotificationDetails(android: androidDetails);
    log(tz.TZDateTime.from(data, tz.local).toString());
    log(tz.TZDateTime.now(tz.local).toString());

    log((tz.TZDateTime.from(data, tz.local).microsecondsSinceEpoch>
       tz.TZDateTime.now(tz.local).microsecondsSinceEpoch).toString());

    if (tz.TZDateTime.from(data, tz.local).microsecondsSinceEpoch>
       tz.TZDateTime.now(tz.local).microsecondsSinceEpoch) {
      log('ok ID ${id}');
      tz.TZDateTime dataFinal = tz.TZDateTime.from(data, tz.local);
      await _notification.zonedSchedule(
          id, title, body, dataFinal, notificationDetails,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
    }
  }

  static DateTime combineDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
  static cancelAllNotifications() async {
  await _notification.cancelAll();
}
}
