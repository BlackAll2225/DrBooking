import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/modules/booking-payment-status/booking_success.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart' as http;

class UniService {
  static String code = '';

  static initLink() async {
    try {
      String? initialLink = await getInitialLink();
      log("Url-handling: $initialLink");
      // uniHandler(uri);
    } catch (e) {
      log(e.toString());
    }
    log("Url-handling");
    linkStream.listen((String? uri) async {
      log("link rr: " + uri.toString());
      //  Get.toNamed(Routes.SIGN_UP);

      await uniHandleLink(uri.toString());
    }, onError: (err) {
      log("Link err");
    });
    uriLinkStream.listen((Uri? uri) async {
      await uniHandler(uri);

      //  Get.toNamed(Routes.SIGN_UP);
    }, onError: (err) {
      log("Link err");
    });
  }

  static uniHandler(Uri? uri) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    if (uri.path == '/payment-success') {
      Get.to(() => BookingSuccess());
      if (uri.queryParameters['appointmentId'].toString().toUpperCase() ==
          'FALSE') {
        await updateAppointment(
            uri.queryParameters['appointmentId'].toString());
      } else {
        await updateAppointmentGeneral(
            uri.queryParameters['appointmentId'].toString());
      }

      log(uri.queryParameters['appointmentId'].toString());
    }
    // Map<String, String> param = uri.queryParameters;
    // String receivedCode = param['code'] ?? '';
    // log("2s2: $receivedCode");
  }

  static uniHandleLink(String url) async {
    try {
      Uri uri = Uri.parse(url);
      log(uri.queryParameters['vnp_ReturnUrl'].toString());
      Uri uri2 = Uri.parse(uri.queryParameters['vnp_ReturnUrl'].toString());
      log("hihi : ${uri2.path}");
      log("hihi2:" + uri2.queryParameters['appointmentId'].toString());
      // if (uri2.path == '/payment-success') {
      //   Get.to(() => BookingSuccess());
      //   await updateAppointment(
      //       uri2.queryParameters['appointmentId'].toString());
      // }
    } catch (e) {}
  }

  static updateAppointment(String idAppointment) async {
    await ApiService().validationWithPut(
        'https://be-graduation-thesis.azurewebsites.net/api/v1/appointment/confirm-payment',
        body: idAppointment);
  }

  static updateAppointmentGeneral(String idAppointment) async {
    await ApiService().validationWithPut(
        'https://be-graduation-thesis.azurewebsites.net/api/v1/general-health-check/confirm-payment',
        body: idAppointment);
  }
}
