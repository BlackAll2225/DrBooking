import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends BaseView<VerifyOtpController> {
  const VerifyOtpView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: UtilsReponsive.height(20, context),
            horizontal: UtilsReponsive.height(15, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Kiểm tra email của bạn',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                            text:  TextSpan(
                              style:  TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                 TextSpan(
                                    text:
                                        'Chúng tôi đã gửi cho bạn số OTP gồm 6 chữ số vào email của bạn ',
                                    style: GoogleFonts.montserrat(
                                        fontSize:
                                            UtilsReponsive.height(14, context),
                                        fontWeight: FontWeight.w500)),
                                 TextSpan(
                                    text: '${BaseCommon.instance.accountSession!.email}',
                                    style: GoogleFonts.montserrat(
                                        fontSize:
                                            UtilsReponsive.height(14, context),
                                        fontWeight: FontWeight.bold,
                                        color: ColorsManager.primary))
                              ],
                            ),
                          )),
                    )
                  ]),
            ),
            SizedBoxConst.size(context: context),
            OtpTextField(
              borderRadius: BorderRadius.circular(10),
              focusedBorderColor: Color(0xFF5CB85C),
              fieldWidth: UtilsReponsive.height(50, context),

              numberOfFields: 6,
              borderColor: Color(0xFF5CB85C),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) async {
                await controller.confirmOTP(verificationCode);
              }, // end onSubmit
            ),
            SizedBox(
              height: UtilsReponsive.height(16, context),
            ),
            SizedBox(
              height: UtilsReponsive.height(16, context),
            ),
            Obx(
              () => ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: context.width),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorsManager.primary),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  ),
                  child: controller.isLockButton.value
                      ? CircularProgressIndicator(
                          color: Colors.yellow,
                        )
                      : Text(
                          "Tiếp tục",
                        ),
                  onPressed: () async {
                    // if (controller.enableButton.isTrue) {
                    // }
                  },
                ),
              ),
            ),
            SizedBox(
              height: UtilsReponsive.height(16, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Đã nhận được mã OTP? '),
                TextButton(
                    onPressed: () async {
                      if (controller.countDown.value == 0) {
                        controller.countDownFunction();
                      }
                    },
                    child: Obx(
                      () => Text(
                        controller.countDown == 0
                            ? 'Gửi lại'
                            : 'Gửi lại sau 00:' +
                                '${controller.countDown.value < 10 ? '0' : ''}' +
                                '${controller.countDown}',
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
