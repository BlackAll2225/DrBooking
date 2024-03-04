import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarView extends BaseView<TabCalendarController> {
  const TabCalendarView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: UtilsReponsive.height(30, context)),
        child: Column(
          children: [
            Center(
              child: TextConstant.titleH3(context, text: 'Quản lý lịch khám'),
            ),
            SizedBoxConst.size(context: context, size: 20),
            Center(
              child: SizedBox(
                width: UtilsReponsive.height(300, context),
                height: UtilsReponsive.height(30, context),
                child: Obx(() => Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () async {
                            await controller.swapStatus(isHistory: false);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.isHistory.value
                                    ? Colors.grey
                                    : ColorsManager.primary,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        UtilsReponsive.height(10, context)),
                                    topLeft: Radius.circular(
                                        UtilsReponsive.height(10, context)))),
                            child: Center(
                                child: TextConstant.subTile3(context,
                                    text: 'Sắp tới',
                                    color: controller.isHistory.value
                                        ? Colors.black
                                        : Colors.white)),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () async {
                            await controller.swapStatus(isHistory: true);
                          },
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: !controller.isHistory.value
                                    ? Colors.grey
                                    : ColorsManager.primary,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                        UtilsReponsive.height(10, context)),
                                    topRight: Radius.circular(
                                      UtilsReponsive.height(10, context),
                                    ))),
                            child: Center(
                                child: TextConstant.subTile3(context,
                                    color: !controller.isHistory.value
                                        ? Colors.black
                                        : Colors.white,
                                    text: 'Kết thúc')),
                          ),
                        ))
                      ],
                    )),
              ),
            ),
            SizedBoxConst.size(context: context),
           Obx(() => controller.isLoading.value?Center(child: CupertinoActivityIndicator(color: ColorsManager.primary,),): ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: controller.listBookingPreview.value.length,
              separatorBuilder: (context, index) =>
                  SizedBoxConst.size(context: context),
              itemBuilder: (context, index) => _itemCard(context, booking: controller.listBookingPreview[index]),
            )),
            SizedBoxConst.size(
                context: context, size: UtilsReponsive.height(15, context)),
          ],
        ),
      ),
    );
  }

  _itemCard(BuildContext context, {required BookingPreview booking}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BOOKING_DETAIL);
      },
      child: SizedBox(
          // margin: EdgeInsets.all(UtilsReponsive.height(5, context)),
          // padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
          height: UtilsReponsive.height(170, context),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
                margin:
                    EdgeInsets.only(top: UtilsReponsive.height(15, context)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white, // Màu nền của container
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: UtilsReponsive.height(150, context),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: ColorsManager.primary,
                              ),
                              SizedBoxConst.sizeWith(context: context, size: 5),
                              TextConstant.subTile3(context,
                                  text: FormatDataCustom.convertDatetoFullDate(date: booking.date)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: ColorsManager.primary,
                              ),
                              SizedBoxConst.sizeWith(context: context, size: 5),
                              TextConstant.subTile3(context, text: booking.time)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBoxConst.size(context: context),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: ColorsManager.primary,
                        ),
                        SizedBoxConst.sizeWith(context: context, size: 5),
                        TextConstant.subTile3(context, text: booking.name),
                      ],
                    ),
                    SizedBoxConst.size(context: context),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: ColorsManager.primary,
                        ),
                        SizedBoxConst.sizeWith(context: context, size: 5),
                        TextConstant.subTile3(context,
                            text: booking.branch),
                      ],
                    ),
                    SizedBoxConst.size(context: context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UtilsReponsive.height(10, context),
                              vertical: UtilsReponsive.height(5, context)),
                          decoration: BoxDecoration(
                              color: ColorsManager.primary,
                              borderRadius: BorderRadius.circular(
                                  UtilsReponsive.height(8, context))),
                          child: TextConstant.subTile3(context,
                              text: "Chi tiết", color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: UtilsReponsive.height(5, context),
                top: UtilsReponsive.height(5, context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(10, context),
                      vertical: UtilsReponsive.height(5, context)),
                  decoration: BoxDecoration(
                      color: booking.isNew?Colors.green:Colors.brown,
                      borderRadius: BorderRadius.circular(
                          UtilsReponsive.height(8, context))),
                  child: TextConstant.subTile3(context,
                      text: booking.isNew?"Khám mới":"Tái khám", color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
