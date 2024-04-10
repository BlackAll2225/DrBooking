import 'dart:developer';

import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/service/button_service.dart';
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
      height: double.infinity,
      color: Colors.white,
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
                                    ? Colors.grey.withOpacity(0.2)
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
                                    ? Colors.grey.withOpacity(0.2)
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
            SizedBox(
              height: UtilsReponsive.height(50, context),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child:
                          TextConstant.subTile3(context, text: 'Bệnh nhân:')),
                  Expanded(
                    flex: 2,
                    child: Obx(() => _dropDownDataProfile(context)),
                  )
                ],
              ),
            ),
            SizedBoxConst.size(context: context),
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CupertinoActivityIndicator(
                      color: ColorsManager.primary,
                    ),
                  )
                : controller.listBookingPreview.value.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: TextConstant.subTile3(context,
                              text: "Danh sách trống"),
                        ),
                      )
                    : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.listBookingPreview.value.length,
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context),
                        itemBuilder: (context, index) => _itemCard(context,
                            booking: controller.listBookingPreview[index]),
                      )),
            SizedBoxConst.size(
                context: context, size: UtilsReponsive.height(15, context)),
          ],
        ),
      ),
    );
  }

  _itemCard(BuildContext context, {required AppointmentPreview booking}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.BOOKING_DETAIL);
      },
      child: SizedBox(
          height: UtilsReponsive.height(170, context),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
                margin:
                    EdgeInsets.only(top: UtilsReponsive.height(15, context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 2,
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
                                  text: FormatDataCustom.convertDatetoFullDate(
                                      date: booking.start ?? '')),
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
                              TextConstant.subTile3(context,
                                  text:
                                      '${FormatDataCustom.mappingIso8ToSlot(booking.start ?? '')}-${FormatDataCustom.mappingIso8ToSlot(booking.end ?? '')}'),
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
                        TextConstant.subTile3(context,
                            text: booking.doctorName ?? ''),
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
                            text: booking.clinicName ?? ''),
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
                      color: true ? Colors.green : Colors.brown,
                      borderRadius: BorderRadius.circular(
                          UtilsReponsive.height(8, context))),
                  child: TextConstant.subTile3(context,
                      text: appointmentTypeList[booking.appoinmentType??0].label.toString(),
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }

  _dropDownDataProfile(BuildContext context) {
    log(controller.selectedProfile.value.fullname.toString());
    return PopupMenuButton<Profile>(
      onSelected: (Profile newValue) {
        controller.onTapProfile(newValue);
      },
      itemBuilder: (BuildContext context) {
        return controller.listProfile.value
            .map<PopupMenuItem<Profile>>((Profile value) {
          return PopupMenuItem<Profile>(
            value: value,
            child: Container(
              height: 40, // Chiều cao của mỗi mục dropdown
              child: Center(
                child: Text(value.fullname ?? ''),
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        height: 40, // Chiều cao của dropdown button
        width: 200, // Chiều rộng của dropdown button
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // Bo tròn các góc
          border: Border.all(color: Colors.grey), // Đường viền
        ),
        child: Center(
          child: TextConstant.subTile3(context,
              text: controller.selectedProfile.value.fullname.toString()),
        ),
      ),
    );
  }
}
