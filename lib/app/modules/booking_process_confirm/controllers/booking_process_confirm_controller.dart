import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/base/config.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingProcessConfirmController extends BaseController {
  //TODO: Implement BookingProcessConfirmController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  testPayment() async {
    

    String payment =
        'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=50000000&vnp_Command=pay&vnp_CreateDate=20240410195629&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh+toan+cho+ma+GD%3A10195629&vnp_OrderType=other&vnp_ReturnUrl=https%3A%2F%2Fgoogle.com&vnp_TmnCode=COZ7YL1C&vnp_TxnRef=10195629&vnp_Version=2.1.0&vnp_SecureHash=efc192394d65525acba11f2feb3f8bc0568d62066be314d45dc0f493fc3e21f74db463c2588f52dafdcfd0497ef2da4b27ba386bf4d88a83d0ab20f50306cf3f';
    log(payment);
    if (await canLaunchUrl(Uri.parse(payment))) {
      await launchUrl(Uri.parse(payment), mode: LaunchMode.externalApplication);
    }
  }

  String encodeVnpParams(Map<String, dynamic> params) {
    List<String> queryComponents = [];
    params.forEach((key, value) {
      queryComponents.add('$key=${Uri.encodeQueryComponent(value.toString())}');
    });
    return queryComponents.join('&');
  }
}
