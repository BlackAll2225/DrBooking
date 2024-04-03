import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_general_controller.dart';

class BookingGeneralView extends BaseView<BookingGeneralController> {
  const BookingGeneralView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
  return Scaffold(
     body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    text: 'Khám tổng quát', fontWeight: FontWeight.w700),
                const SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBoxConst.size(context: context),
                TextConstant.subTile1(context,
                    text: 'Thông tin bệnh nhân',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                Container(
                  margin:
                      EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                  width: UtilsReponsive.height(120, context),
                  height: UtilsReponsive.height(2, context),
                  color: ColorsManager.primary,
                ),
                SizedBoxConst.size(context: context),
               _cardProfile(context),
                SizedBoxConst.size(context: context),
                TextConstant.subTile1(context,
                    text: 'Thông tin lịch khám',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                Container(
                  margin:
                      EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                  width: UtilsReponsive.height(120, context),
                  height: UtilsReponsive.height(2, context),
                  color: ColorsManager.primary,
                ),
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Chi nhánh',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: '*',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.red,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
                SizedBoxConst.size(context: context),
                GestureDetector(
                  onTap: () async {
                    await controller.showBottomBranch();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(UtilsReponsive.height(8, context)),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                            UtilsReponsive.height(10, context))),
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConstant.subTile2(context,
                                text: controller.selectedClinic.value.name),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        )),
                  ),
                ),
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Thời gian',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: '*',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.red,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
                SizedBoxConst.size(context: context),
                GestureDetector(
                  onTap: () {
                    controller.onTapTimeWidget();
                  },
                  child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(8, context)),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                              UtilsReponsive.height(10, context))),
                      child:
                          // Obx(() =>
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Obx(()=>  TextConstant.subTile2(context,
                              text: controller.concatSlotTime.value)),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      )
                      // ),
                      ),
                ),
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Mô tả triệu chứng',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
                SizedBoxConst.size(context: context),
                FormFieldWidget(
                  setValueFunc: (value) {},
                  maxLine: 4,
                  borderColor: Colors.grey,
                  labelText: "Mô tả triệu chứng",
                  padding: 15,
                  paddingVerti: 15,
                  radiusBorder: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(10, context)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.primary,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: ColorsManager.primary,
                              width: UtilsReponsive.height(2, context)),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(
                          vertical: UtilsReponsive.height(2, context),
                          horizontal: UtilsReponsive.height(20, context)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Tiếp theo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize:
                                UtilsReponsive.formatFontSize(12, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async {
                      Get.toNamed(Routes.BOOKING_PROCESS_CONFIRM);
                    },
                  ),
                ),
              ],
            ),
          ))
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
      // margin: EdgeInsets.symmetric(
      //   horizontal: UtilsReponsive.height(10, context),
      // ),
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
                  text: '${controller.requestParamBooking.profile?.fullname}', fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: UtilCommon.convertDateTime(controller.requestParamBooking.profile!.dateOfBirth!),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }
}