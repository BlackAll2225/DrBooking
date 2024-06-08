import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/modules/welcome_board/views/welcome_board_view.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeBoardController extends BaseController {
  //TODO: Implement WelcomeBoardController

  final count = 0.obs;
  PageController pageController = PageController();
  RxInt indexPage = 0.obs;
  RxBool textNext = true.obs;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken;
  @override
  Future<void> onInit() async {
    _firebaseMessaging.requestPermission();
    deviceToken = await _firebaseMessaging.getToken();
    await initDataValue();
    super.onInit();
    // await checkLocationPermission();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void jumpToPage() {
    if (indexPage.value + 1 < 3) {
      indexPage++;
      pageController.animateToPage(indexPage.value,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void changePage(int value) {
    if (value == 2) {
      textNext(false);
    } else {
      textNext(true);
    }
    indexPage.value = value;
  }

  initDataValue() async {
    log('Device: $deviceToken');
    await AuthRemote().refreshToken(deviceToken: '$deviceToken').then((jwt) async {
      await BaseCommon.instance.saveToken(jwt);
      await BaseCommon.instance.decodeJWT();
      await Future.delayed(Duration(seconds: 1));
      Get.offAllNamed(Routes.CHECK_PERMISSION);
    }).catchError((err){
      Get.to(WelcomeBoardView());
    });
  }
}
