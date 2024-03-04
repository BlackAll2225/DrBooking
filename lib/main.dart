import 'package:drbooking/app/base/base_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

void main() async {
  BaseCommon baseCommon = BaseCommon.instance;
  baseCommon.mode = LOCAL_MODE;
  runApp(
    GetMaterialApp(
      title: "DrBooking",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
    ),
  );
}
