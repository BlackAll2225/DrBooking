import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../controllers/welcome_board_controller.dart';

class WelcomeBoardView extends BaseView<WelcomeBoardController> {
  const WelcomeBoardView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          PageView(
            onPageChanged: (value) {
              controller.changePage(value);
            },
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            children: [
              pageItem(ColorsManager.primary.withOpacity(0.5), ColorsManager.primary,
                  ImageAssets.welcome1, "Text Welcome 1"),
              pageItem(ColorsManager.primary.withOpacity(0.5), ColorsManager.primary,
                   ImageAssets.welcome2, "Text Welcome 2"),
              pageItem(ColorsManager.primary.withOpacity(0.5), ColorsManager.primary,
                  ImageAssets.welcome3, "Text Welcome 3"),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: UtilsReponsive.height(80,context ),
                color: Colors.transparent,
                child: Obx(
                  () => controller.textNext.isFalse
                      ? Center(
                          child: TextButton(
                              onPressed: () {
                                Get.offAllNamed(Routes.SIGN_IN);
                              },
                              child: Text(
                                'Bắt đầu',
                                style: TextStyle(color: Colors.black),
                              )),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: UtilsReponsive.width(10, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.offAllNamed(Routes.HOME);
                                  },
                                  child: Text(
                                    'Bỏ qua',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Center(
                                child: SmoothPageIndicator(
                                    controller: controller
                                        .pageController, // PageController
                                    count: 3,
                                    effect:const ExpandingDotsEffect(
                                      dotColor: Colors.black,
                                      activeDotColor:Colors.white,
                                      spacing: 20,
                                    ),
                                    // your preferred effect
                                    onDotClicked: (index) {
                                      controller.pageController.animateToPage(
                                          index,
                                          duration:const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                    }),
                              ),
                              IconButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    controller.jumpToPage();
                                  },
                                  icon:const Icon(Icons.arrow_forward))
                            ],
                          ),
                        ),
                ),
              ))
        ]),
      ),
    ));
  }

  Container pageItem(
      Color color1, Color color2, String pathImage, String textTitle) {
    return Container(
      child: Stack(
        children: [
          Column(children: [
            Expanded(
                child: Container(
              color: color1,
            )),
            Expanded(
                // flex: 2,
                child: Container(
                  color: color2,
                ))
          ]),
          Positioned(
              top: UtilsReponsive.height(134,Get.context!),
              right: 0,
              left: 0,
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Lottie.asset(pathImage)),
                  Text(textTitle)
                ],
              ))
        ],
      ),
    );
  }
}
