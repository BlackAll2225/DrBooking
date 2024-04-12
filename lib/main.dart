import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/context_uni.dart';
import 'package:drbooking/app/base/uni_link_service.dart';
import 'package:drbooking/app/modules/booking_process_confirm/views/booking_process_confirm_view.dart';
import 'package:drbooking/app/modules/welcome_board/views/welcome_board_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.initLink();
  BaseCommon baseCommon = BaseCommon.instance;
  baseCommon.mode = REMOTE_MODE;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    GetMaterialApp(
      navigatorKey: ContextUnility.navigatorKey,
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
