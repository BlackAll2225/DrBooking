import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_process_service_controller.dart';

class BookingProcessServiceView
    extends BaseView<BookingProcessServiceController> {
  const BookingProcessServiceView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppBarCustom(
            callback: () {
              Get.back();
            },
            title:  'Chọn dịch vụ'),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
        child: Column(
            children: controller.listService
                .map((e) =>   _buttonService(context, buttonData: e))
                .toList()),
      ))
    ])));
  }

//'assets/images/mecical-check.png'
  Expanded _buttonService(BuildContext context,
      {required ButtonService buttonData}) {
    Color colorButton = ColorsManager.primary;
    return Expanded(
        child: GestureDetector(
      onTap: () {
        controller.onTapService(buttonData);
      },
      child: Container(
        margin:EdgeInsets.symmetric(vertical: UtilsReponsive.height(25, context)),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(UtilsReponsive.height(10, context)),
            color: colorButton),
        child: Row(
          children: [
            Expanded(child: Image.asset(buttonData.imageUrl)),
            Expanded(
                flex: 3,
                child: TextConstant.titleH2(context,
                    text: buttonData.content, color: Colors.white))
          ],
        ),
      ),
    ));
  }
}
