import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_controller.dart';

class BookingView extends BaseView<BookingController> {
  const BookingView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarCustom(callback: () => Get.back(), title: "Chọn hồ sơ"),
          Expanded(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.all(
                      UtilsReponsive.height(10, context)),
                  child: ListView.separated(
                      padding: EdgeInsets.only(
                          top: UtilsReponsive.height(10, context)),
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          SizedBoxConst.size(context: context),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.toNamed(Routes.BOOKING_PROCESS_BRANCH),
                          child: _cardProfile(context)))))
        ],
      ),
    ));
  }

  Container _cardProfile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(UtilsReponsive.height(5, context)),
      ),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.width(100, context),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorsManager.primary.withOpacity(0.5),
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            margin: EdgeInsets.symmetric(
              horizontal: UtilsReponsive.height(10, context),
            ),
            width: UtilsReponsive.width(70, context),
            height: UtilsReponsive.width(70, context),
            child: Image.asset(
              ImageAssets.logo,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConstant.subTile1(context,
                  text: 'Nguyễn Văn A', fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: '12/12/1999',
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }
}
