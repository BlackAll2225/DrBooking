import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          Obx(()=>
            controller.isLoading.value?LoadingWidget(): Expanded(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: UtilsReponsive.height(100, context),
                  width: double.infinity,
                  child: Obx(() => _cardProfile(context,
                      profile: controller.listProfile.value[0])),
                ),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBoxConst.size(context: context),
                  itemCount: 4,
                  itemBuilder: (context, index) => _medicalRecord(context),
                ))
              ],
            )),
          )
        ],
      ),
    ));
  }

  Container _cardProfile(BuildContext context, {required Profile profile}) {
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
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConstant.subTile1(context,
                      text: profile.fullname??"", fontWeight: FontWeight.bold),
                  SizedBoxConst.size(context: context),
                  TextConstant.subTile2(context,
                      text: profile.dateOfBirth.toString(),
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: TextConstant.subTile2(context,
                      fontWeight: FontWeight.bold,
                      text: 'Đổi',
                      color: ColorsManager.primary))
            ],
          ))
        ],
      ),
    );
  }

  _medicalRecord(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: UtilsReponsive.height(5, context)),
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
                        text: '12/23/23', color: Colors.white),
                  ],
                ),
                Icon(
                  Icons.read_more_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _textData(context,
                    title: 'Chi nhánh', content: 'Nguyễn Văn Lượng'),
                SizedBoxConst.size(context: context),
                _textData(context,
                    title: 'Bác sĩ khám', content: 'Nguyễn Văn A'),
                SizedBoxConst.size(context: context),
                _textData(context, title: 'Triệu chứng', content: ''),
                SizedBoxConst.size(context: context),
                FormFieldWidget(
                  setValueFunc: (value) {},
                  maxLine: 3,
                  isEnabled: false,
                  radiusBorder: 15,
                  initValue:
                      'Sit amet ea deserunt pariatur., amet ea deserunt pariatur.',
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
                      'Sit amet ea deserunt pariatur., amet ea deserunt pariatur.',
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
