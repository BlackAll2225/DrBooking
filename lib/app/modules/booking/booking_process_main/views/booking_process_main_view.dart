import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/modules/doctor/views/doctor_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_process_main_controller.dart';

class BookingProcessMainView extends BaseView<BookingProcessMainController> {
  const BookingProcessMainView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppBarCustom(
                callback: () {
                  Get.back();
                },
                title: 'Khám chuyên khoa'),
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
                Obx(() => _cardProfile(context)),
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
                Visibility(
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxConst.size(context: context),
                      RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.titleSmall,
                              children: <TextSpan>[
                            TextSpan(
                              text: 'Chuyên Khoa',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: const Color(0xff979797),
                                      fontSize:
                                          UtilsReponsive.height(14, context)),
                            ),
                            TextSpan(
                              text: '*',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.red,
                                      fontSize:
                                          UtilsReponsive.height(14, context)),
                            ),
                          ])),
                      SizedBoxConst.size(context: context),
                      GestureDetector(
                        onTap: () async => await showBottomSpecial(),
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
                          child: Obx(() => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextConstant.subTile2(context,
                                        text: controller
                                            .selectedSpecialty.value.name!),
                                  ),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxConst.size(context: context),
                Obx(() => Visibility(
                      visible: controller.listSpecialty.value
                          .contains(controller.selectedSpecialty.value),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Bác sĩ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color(0xff979797),
                                          fontSize: UtilsReponsive.height(
                                              14, context)),
                                ),
                              ])),
                          SizedBoxConst.size(context: context),
                          GestureDetector(
                            onTap: () async {
                             controller.onTapChoiceDoctor();
                            },
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(
                                    UtilsReponsive.height(8, context)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        UtilsReponsive.height(10, context))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextConstant.subTile2(context,
                                        text: controller
                                            .selectedDoctor.value.fullname??''),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )),
                SizedBoxConst.size(context: context),
                Obx(
                  () => Visibility(
                      visible: controller.selectedSpecialty.value.id!=null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Thời gian',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color(0xff979797),
                                          fontSize: UtilsReponsive.height(
                                              14, context)),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.red,
                                          fontSize: UtilsReponsive.height(
                                              14, context)),
                                ),
                              ])),
                          SizedBoxConst.size(context: context),
                          GestureDetector(
                            onTap: () {
                              controller.onTapTimeWidget();
                            },
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(
                                    UtilsReponsive.height(8, context)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        UtilsReponsive.height(10, context))),
                                child:
                                    // Obx(() =>
                                    Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => TextConstant.subTile2(context,
                                        text: controller.concatSlotTime.value)),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                )
                                // ),
                                ),
                          ),
                          SizedBoxConst.size(context: context),
                        ],
                      )),
                ),
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
                  controllerEditting: controller.symptomController,
                  setValueFunc: (value) {},
                  maxLine: 4,
                  borderColor: Colors.grey,
                  labelText: "Mô tả triệu chứng",
                  padding: 15,
                  paddingVerti: 15,
                  radiusBorder: 10,
                ),
                             Obx(()=>_buttomNext(context, controller.selectedSlot.value.dutyScheduleId.isNotEmpty)),
              ],
            ),
          ))
        ],
      ),
    ));
  }
   Container _buttomNext(BuildContext context, bool isEnable) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:isEnable? ColorsManager.primary:Colors.grey,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isEnable? ColorsManager.primary:Colors.grey,
                  width: UtilsReponsive.height(2, context)),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(2, context),
              horizontal: UtilsReponsive.height(20, context)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: TextConstant.subTile2(
            context,
            text: 'Tiếp theo',
            color: isEnable?Colors.white:Colors.black
          ),
        ),
        onPressed: () async {
          // controller.selectedSlot.value = DutySchedule.emtyObject();
          controller.onTapNextButton();
        },
      ),
    );
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
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: controller.requestParamBooking.patient?.avatarUrl ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.white,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageAssets.logo),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConstant.subTile1(context,
                  text: '${controller.requestData.value.patient?.fullname}',
                  fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: UtilCommon.convertDateTime(
                      controller.requestData.value.patient!.dateOfBirth!),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }

  showBottomSpecial() async {
    controller.isLoading.value = true;
    controller.fetchDataSpecialtys(
        idClinic: controller.requestParamBooking.clinic!.id);
    await Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
            topRight: Radius.circular(UtilsReponsive.height(10, Get.context!)),
          )),
      padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
      constraints:
          BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
      child: Column(
        children: [
          TextConstant.subTile1(Get.context!, text: 'Chuyên khoa'),
          Expanded(
              child: Obx(() => controller.isLoading.value
                  ? CupertinoActivityIndicator(
                      color: ColorsManager.primary,
                    )
                  : ListView.builder(
                      itemCount: controller.listSpecialty.value.length,
                      itemBuilder: (context, index) {
                        if (index == controller.listSpecialty.value.length) {
                          return Obx(() => controller.isFetchMore.value
                              ? CupertinoActivityIndicator(
                                  color: ColorsManager.primary,
                                )
                              : SizedBox());
                        }
                        return GestureDetector(
                          onTap: () async {
                            controller
                                .onTapSpecial(controller.listSpecialty[index]);
                            Get.back();
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: UtilsReponsive.height(15, context)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextConstant.subTile2(context,
                                        text: controller
                                            .listSpecialty[index].name!),
                                  ),
                                  controller.listSpecialty[index].id ==
                                          controller.selectedSpecialty.value.id
                                      ? Icon(Icons.check)
                                      : SizedBox.shrink()
                                ],
                              ),
                            ),
                          ),
                        );
                      })))
        ],
      ),
    ));
  }
}
