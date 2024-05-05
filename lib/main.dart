import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/context_uni.dart';
import 'package:drbooking/app/base/uni_link_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.initLink();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BaseCommon baseCommon = BaseCommon.instance;
  await baseCommon.init(mode: REMOTE_MODE);
  baseCommon.mode = REMOTE_MODE;
  runApp(
    GetMaterialApp(
      navigatorKey: ContextUnility.navigatorKey,
      title: "DrBooking",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
        
      ],
    ),
  );
}
