
import 'dart:ui';

import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckPermissionController extends FullLifeCycleController
    with FullLifeCycleMixin {
  final count = 0.obs;
  final isLoadingChecking = true.obs;
  final isProcess = false.obs;
  final isRegisted = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkLocationPermission();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if ((permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) &&
        await Geolocator.isLocationServiceEnabled()) {
      isLoadingChecking(false);
      isRegisted(true);

      Get.offAllNamed(Routes.HOME);
    } else {
      await testRequestLocationPermission();
      isLoadingChecking(false);
    }
  }

  Future<void> testRequestLocationPermission() async {
    if (!isProcess.value) {
      PermissionStatus locationStatus = await Permission.location.request();

      if (locationStatus != PermissionStatus.granted) {
        if (locationStatus == PermissionStatus.denied) {
        } else if (locationStatus == PermissionStatus.permanentlyDenied) {
          await openAppSettings();
        }
      } else {}
    }
  }

  @override
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    // TODO: implement didChangeLocales
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
  }

  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
  }

  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    // TODO: implement didPushRouteInformation
    throw UnimplementedError();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    // TODO: implement didRequestAppExit
    throw UnimplementedError();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  Future<void> onResumed() async {
    try {
      PermissionStatus locationStatus = await Permission.location.status;
      if (locationStatus == PermissionStatus.granted) {
        isRegisted(true);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      isProcess(false);
    }
  }
}
