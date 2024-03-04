import 'package:drbooking/app/base/base_view.dart';
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
      Padding(
        padding: EdgeInsets.only(
            top: UtilsReponsive.height(20, context),
            right: UtilsReponsive.height(10, context),
            left: UtilsReponsive.height(10, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: UtilsReponsive.height(2, context)),
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(10, context))),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            TextConstant.titleH2(context,
                text: 'Chọn dịch vụ', fontWeight: FontWeight.w700),
            const SizedBox.shrink(),
          ],
        ),
      ),
      Expanded(
          child: Padding(
            padding:  EdgeInsets.all(UtilsReponsive.height(20, context)),
            child: Column(
                  children: [
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BOOKING_PROCESS, arguments: false);
                  },
                  child: Container(
                              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context)),
                  color: ColorsManager.primary),
                              child:Row(
                  children: [
                    Expanded(child: Image.asset('assets/images/mecical-check.png')),
                    Expanded(
                      flex: 3,
                      child: TextConstant.titleH2(context, text: "Khám tổng quát",color: Colors.white))
                  ],
                              ),
                            ),
                )),
            SizedBoxConst.size(context: context,size: 50),
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BOOKING_PROCESS, arguments: true);
                  },
                  child: Container(
                              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context)),
                  color: ColorsManager.primary),
                              child:Row(
                  children: [
                   Expanded(child: Image.asset('assets/images/medical-check1.png')),
                    Expanded(
                      flex: 3,
                      child: TextConstant.titleH2(context, text: "Khám Chuyên Khoa",color: Colors.white))
                  ],
                              ),
                            ),
                )),
            SizedBoxConst.size(context: context,size: 50),
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BOOKING_PROCESS, arguments: false);
                  },
                  child: Container(
                              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context)),
                  color: ColorsManager.primary),
                              child:Row(
                  children: [
                    Expanded(child: Image.asset('assets/images/medical-lab.png')),
                    Expanded(
                      flex: 3,
                      child: TextConstant.titleH2(context, text: "Xét nghiệm",color: Colors.white))
                  ],
                              ),
                            ),
                )),
            SizedBoxConst.size(context: context,size: 50),
            Expanded(
                child: GestureDetector(
                  onTap:() {
                    Get.toNamed(Routes.BOOKING_PROCESS, arguments: true);
                  },
                  child: Container(
                              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context)),
                  color: ColorsManager.primary),
                              child:Row(
                  children: [
                              Expanded(child: Image.asset('assets/images/medical-check3.png')),
                    Expanded(
                      flex: 3,
                      child: TextConstant.titleH2(context, text: "Khám theo yêu cầu",color: Colors.white))
                  ],
                              ),
                            ),
                )),
            SizedBoxConst.size(context: context,size: 50),
                  ],
                ),
          ))
    ])));
  }
}
