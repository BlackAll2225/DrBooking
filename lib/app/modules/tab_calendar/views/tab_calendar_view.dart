import 'dart:developer';

import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../controllers/tab_calendar_controller.dart';

class TabCalendarView extends BaseView<TabCalendarController> {
  const TabCalendarView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
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
                    child: Obx(() => GestureDetector(
                          onTap: () async {
                            await _bottomPatients(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: UtilsReponsive.height(5, context),
                                horizontal: UtilsReponsive.height(10, context)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(
                                    UtilsReponsive.height(10, context))),
                            child: TextConstant.subTile3(context,
                                text:
                                    controller.selectedPatient.value.fullname!),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Obx(()=>
             Visibility(
                visible: controller.isHistory.value,
                child: SizedBox(
                  height: UtilsReponsive.height(50, context),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextConstant.subTile3(context, text: 'Tháng:')),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () async {
                            final selected = await showMonthYearPicker(
                                context: context,
                                initialDate: controller.selectedTime.value ??
                                    DateTime.now(),
                                firstDate: DateTime(2019),
                                lastDate: DateTime(DateTime.now().year + 1),
                                locale: Locale('vi', 'VN'));
                            if (selected != null) {
                              await controller.fetchBookingWithTime(selected);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: UtilsReponsive.height(5, context),
                                horizontal: UtilsReponsive.height(10, context)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(
                                    UtilsReponsive.height(10, context))),
                            child: Obx(() => TextConstant.subTile3(context,
                                text: DateFormat('MMMM - yyyy', 'vi')
                                    .format(controller.selectedTime.value))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                    : Expanded(
                        child: Obx(() => ListView.separated(
                            controller: controller.scroller,
                            shrinkWrap: true,
                            itemCount:
                                controller.listBookingPreview.value.length + 1,
                            separatorBuilder: (context, index) =>
                                SizedBoxConst.size(context: context),
                            itemBuilder: (context, index) {
                              if (index ==
                                  controller.listBookingPreview.value.length) {
                                return Obx(() => controller.isFetchMore.value
                                    ? CupertinoActivityIndicator(
                                        color: ColorsManager.primary,
                                      )
                                    : SizedBox());
                              }
                              return _itemCard(context,
                                  booking:
                                      controller.listBookingPreview[index]);
                            })),
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
        Get.toNamed(Routes.BOOKING_DETAIL, arguments: booking.idAppointment);
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
                            text: booking.patientName ?? ''),
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
                      text: appointmentTypeList[booking.appoinmentType!>0 ?booking.appoinmentType!: 0]
                          .label
                          .toString(),
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }

  _bottomPatients(BuildContext context) async {
    controller.searchTextController.text = '';
    controller.skipSub = 0;
    controller.listPatients.value = [];
    await controller.fetchAlClients();
    Get.bottomSheet(Container(
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(10, context)),
              topRight: Radius.circular(UtilsReponsive.height(10, context)))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConstant.subTile1(context,
                  text: 'Bệnh nhân', fontWeight: FontWeight.bold),
              TextButton(
                  onPressed: () async {
                    Get.back();
                    await controller.resetPatient();
                  },
                  child: TextConstant.subTile3(context,
                      text: 'Làm mới', color: ColorsManager.primary))
            ],
          ),
          SizedBoxConst.size(context: context),
          TextField(
            onChanged: (value) async {
              await controller.fetchPatientsWithSearch();
            },
            controller: controller.searchTextController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: UtilsReponsive.height(5, context),
                  horizontal: UtilsReponsive.height(15, context)),
              suffixIcon: IconButton(
                  onPressed: () async {
                    await controller.clearText();
                  },
                  icon: Icon(Icons.close)),
              // contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      UtilsReponsive.height(10, context))),
              hintText: 'Nhập tên để tìm kiếm',
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                // controller: controller.scroller,
                itemCount: controller.listPatients.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.listPatients.value.length) {
                    return Obx(() => controller.isProcessSub.value
                        ? CupertinoActivityIndicator(
                            color: ColorsManager.primary,
                          )
                        : SizedBox());
                  }
                  return ListTile(
                    onTap: () async {
                      Get.back();
                      await controller
                          .onTapProfile(controller.listPatients.value[index]);
                    },
                    title: TextConstant.subTile3(context,
                        text: controller.listPatients[index].fullname!),
                  );
                })),
          )
        ],
      ),
    ));
  }
}
