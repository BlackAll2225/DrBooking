import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/check_permission_controller.dart';

class CheckPermissionView extends GetView<CheckPermissionController> {
  const CheckPermissionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              ColorsManager.primary.withOpacity(0.1),

              // ColorsManager.primary
            ], // Thay đổi màu sắc theo ý muốn
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DR. BOOKING',
                style: GoogleFonts.montserratAlternates(
                    shadows: [
                      BoxShadow(
                         color: Colors.black87,
                        spreadRadius: 10,
                        blurRadius: 2,
                        offset: Offset(2, 4),
                      ),
                    ],
                    letterSpacing: 3,
                    color: Colors.white,
                    fontSize: UtilsReponsive.formatFontSize(42, context),
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: UtilsReponsive.height(100, context),
                width: UtilsReponsive.width(100, context),
                child: SpinKitFadingCircle(
                  color: Colors.white, // Màu của nét đứt
                  size: 50.0, // Kích thước của CircularProgressIndicator
                ),
              ),
              Obx(() => controller.isLoadingChecking.value
                  ? TextConstant.subTile1(context,
                      text: 'Kiểm tra quyền truy cập vị trí',
                      color: Colors.white)
                  : controller.isRegisted.value
                      ? TextConstant.subTile1(context,
                          text: 'Hệ thống đang xử lý vui lòng đợi',
                          color: Colors.white)
                      : Column(
                          children: [
                            Padding(
                              padding:
                                   EdgeInsets.symmetric(horizontal: UtilsReponsive.height(20, context)),
                              child: Text(
                                'Chúng tôi cần bạn cung cấp quyền truy cập vị trí để sử dụng ứng dụng',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize:
                                        UtilsReponsive.height(16, context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: UtilsReponsive.width(20, context),
                                  vertical: UtilsReponsive.width(5, context)),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: ColorsManager.primary),
                                      borderRadius: BorderRadius.circular(
                                          UtilsReponsive.height(20, context)),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorsManager.primary),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: UtilsReponsive.height(
                                              15, context))),
                                ),
                                child: TextConstant.titleH3(
                                  context,
                                  text: 'Cấp quyền',
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  await controller
                                      .testRequestLocationPermission();
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: UtilsReponsive.width(20, context),
                                  vertical: UtilsReponsive.width(5, context)),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: ColorsManager.primary),
                                      borderRadius: BorderRadius.circular(
                                          UtilsReponsive.height(20, context)),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: UtilsReponsive.height(
                                              15, context))),
                                ),
                                child: TextConstant.titleH3(
                                  context,
                                  text: 'Quay lại',
                                  color: ColorsManager.primary,
                                ),
                                onPressed: () async {
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                              ),
                            ),
                          ],
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
