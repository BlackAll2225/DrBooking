import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/modules/welcome_board/controllers/welcome_board_controller.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashView extends BaseView<WelcomeBoardController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    Get.find<WelcomeBoardController>();
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
              ColorsManager.primary,
              Colors.white,
              Colors.white,
              ColorsManager.primary,
              Colors.white,

            ], // Thay đổi màu sắc theo ý muốn
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                                      child: SizedBox(
                                          height: UtilsReponsive.height(
                                              200, context),
                                          width: double.infinity,
                                          child: Center(
                                              child: Image(
                                                  image: AssetImage(
                                                      ImageAssets.logo),
                                                  fit: BoxFit.fitWidth)))),
              Text(
                'Dr. Booking',
                style: GoogleFonts.montserratAlternates(
                    letterSpacing: 3,
                    color: ColorsManager.primary,
                    fontSize: UtilsReponsive.formatFontSize(42, context),
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: UtilsReponsive.height(100, context),
                width: UtilsReponsive.width(100, context),
                child: SpinKitFadingCircle(
                  color: ColorsManager.primary, // Màu của nét đứt
                  size: 50.0, // Kích thước của CircularProgressIndicator
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
