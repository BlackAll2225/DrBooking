import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/medical_record_controller.dart';

class MedicalRecordView extends BaseView<MedicalRecordController> {
  const MedicalRecordView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarCustom(
              callback: () {
                Get.back();
              },
              title: "Hồ sơ bệnh án"),
          SizedBoxConst.size(context: context),
          Obx(
            () => controller.isLoading.value
                ? LoadingWidget()
                : Expanded(
                    child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: UtilsReponsive.height(80, context),
                        width: double.infinity,
                        child:    GestureDetector(
                          onTap: () async {
                            await _bottomPatients(context);
                          },
                          child: Obx(()=>_cardProfile(context, profile: controller.selectedProfile.value)),
                        ),
                      ),
                      Obx(() => controller.isFetchData.value
                          ? CupertinoActivityIndicator()
                          : controller.listMedicalRecord.value.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: TextConstant.subTile2(context,
                                        text: 'Không có dữ liệu'),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBoxConst.size(context: context),
                                  itemCount: controller.listMedicalRecord.value.length,
                                  itemBuilder: (context, index) =>
                                      _medicalRecord(context, controller.listMedicalRecord[index]),
                                )))
                    ],
                  )),
          )
        ],
      ),
    ));
  }

  Container _cardProfile(BuildContext context,
      {required PatientPreview profile}) {
    return Container(
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
              imageUrl: profile.avatarUrl ?? '',
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
                  text: profile.fullname ?? '', fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: DateFormat('dd/MM/yyyy')
                      .format(profile.dateOfBirth ?? DateTime.now()),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }

  _bottomPatients(BuildContext context) async {
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
            
            ],
          ),
          SizedBoxConst.size(context: context),
        
          Expanded(
            child: Obx(() => ListView.builder(
                // controller: controller.scroller,
                itemCount: controller.listProfile.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.listProfile.value.length) {
                    return Obx(() => controller.isFetchMore.value
                        ? CupertinoActivityIndicator(
                            color: ColorsManager.primary,
                          )
                        : SizedBox());
                  }
                  return Container(
                     decoration: BoxDecoration(
                            boxShadow:controller.listProfile[index].patientId! == controller.selectedProfile.value.patientId? [
                              BoxShadow(
                                color: ColorsManager.primary,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ]:[
                               BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () async {
                        Get.back();
                      await controller.onTapProfile(controller.listProfile.value[index]);
                      },
                      title: TextConstant.subTile3(context,
                          text: controller.listProfile[index].fullname!),
                    ),
                  );
                })),
          )
        ],
      ),
    ));
  }

  _medicalRecord(BuildContext context, MedicalRecord medicalRecord) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
        horizontal: UtilsReponsive.width(20, context),
      ),
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: UtilsReponsive.height(40, context),
            color: ColorsManager.primary,
            padding: EdgeInsets.symmetric(
                horizontal: UtilsReponsive.height(5, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    SizedBoxConst.sizeWith(context: context),
                    TextConstant.subTile2(context,
                        text: FormatDataCustom.convertDatetoFullDate(date: DateFormat('yyyy-MM-dd').format(medicalRecord.startTime!) ?? ''), color: Colors.white),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BOOKING_DETAIL,arguments: medicalRecord.appointmentId);
                  },
                  child: Icon(
                    Icons.read_more_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _textData(context,
                    title: 'Chi nhánh', content: medicalRecord.medicalSpecialtyName??''),
                SizedBoxConst.size(context: context),
                _textData(context,
                    title: 'Bác sĩ khám', content: medicalRecord.reExaminationDate!=null? DateFormat('dd/MM/yyyy')
                      .format(DateTime.parse(medicalRecord.reExaminationDate)):''),
                SizedBoxConst.size(context: context),
                _textData(context, title: 'Triệu chứng', content: ''),
                SizedBoxConst.size(context: context),
                FormFieldWidget(
                  setValueFunc: (value) {},
                  maxLine: 3,
                  isEnabled: false,
                  radiusBorder: 15,
                  initValue:
                      medicalRecord.symptom,
                  padding: 10,
                  paddingVerti: 10,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
                SizedBoxConst.size(context: context),
                _textData(context, title: 'Kết luận bác sĩ', content: ''),
                SizedBoxConst.size(context: context),
                FormFieldWidget(
                  setValueFunc: (value) {},
                  maxLine: 3,
                  isEnabled: false,
                  radiusBorder: 15,
                  initValue:
                   medicalRecord.note,
                  padding: 10,
                  paddingVerti: 10,
                  fillColor: Colors.grey.withOpacity(0.5),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _textData(BuildContext context,
      {required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextConstant.subTile2(context, text: title, color: Colors.black87),
        TextConstant.subTile2(context,
            text: content, fontWeight: FontWeight.bold),
      ],
    );
  }

  
}
