import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/new_profile_controller.dart';

class NewProfileView extends BaseView<NewProfileController> {
  const NewProfileView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    controller.dateCurrent.value;
    return Scaffold(
      bottomNavigationBar: Obx(() => controller.indexPage.value == 0
          ? _buttonNext(context)
          : _buttonCombo(context)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarCustom(
              callback: () {
                if (controller.indexPage.value == 0) {
                  Get.back();
                } else {
                  controller.ontapBack();
                }
              },
              title: "Hồ sơ mới"),
          Expanded(
              child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            children: [
              _pageInforBasic(context),
              _pageInforMore(context),
            ],
          ))
        ],
      )),
    );
  }

  Container _pageInforBasic(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      // color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  IconAssets.iconInformation,
                  scale: 3,
                ),
                Expanded(
                  child:
                      TextConstant.titleH2(context, text: 'Thông tin cá nhân'),
                ),
              ],
            ),
            SizedBoxConst.size(context: context, size: 5),
            TextConstant.subTile3(context,
                color: ColorsManager.primary,
                text:
                    'Thông tin này sẽ giúp bệnh viện dễ dàng lưu trữ bệnh án về bạn'),
            TextConstant.subTile3(context,
                text: '(*) Thông tin bắt buộc', color: Colors.red),
            SizedBoxConst.size(context: context, size: 20),
            Obx(()=>  _titleText(context, title: 'Họ và tên', subTitle: '* ', textLimit: '( ${controller.limitName.value} / 30 )')),
            SizedBoxConst.size(context: context, size: 5),
            Obx(() => TextField(
                  onChanged: (value) {
                    controller.limitName.value = controller.nameTextController.text.length;
                    controller.nameError.value = ValidationUtil.validationStringLimit(value, 30);
                  },
                  controller: controller.nameTextController,
                  decoration: InputDecoration(
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                )),
            SizedBoxConst.size(context: context, size: 20),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    _titleText(context, title: 'Ngày sinh', subTitle: '*'),
                    SizedBoxConst.sizeWith(context: context, size: 5),
                    GestureDetector(
                      onTap: () => onTapBirth(context),
                      child: Container(
                          padding:
                              EdgeInsets.all(UtilsReponsive.height(5, context)),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(UtilsReponsive.height(
                                5,
                                context,
                              ))),
                          child: Obx(() {
                            controller.dateCurrent.value;
                            return TextConstant.subTile3(context,
                                text: controller.birthTextController.text);
                          })),
                    )
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    _titleText(context, title: 'Giới tính', subTitle: '*'),
                    SizedBoxConst.sizeWith(context: context, size: 10),
                    Obx(() => DropdownButton<Gender>(
                          value: controller.selectedGender.value,
                          onChanged: (Gender? newValue) {
                            controller.selectedGender.value = newValue!;
                          },
                          items: listGender.map((Gender item) {
                            return DropdownMenuItem<Gender>(
                              value: item,
                              child: Text(item.name),
                            );
                          }).toList(),
                        ))
                  ],
                ))
              ],
            ),
            Obx(
              () => Visibility(
                  visible: controller.birthError.value.isNotEmpty,
                  child: TextConstant.subTile3(context,
                      text: controller.birthError.value, color: Colors.red)),
            ),
            SizedBoxConst.size(context: context, size: 20),
            _titleText(context, title: 'Số điện thoại', subTitle: '*'),
            SizedBoxConst.size(context: context),
            Obx(() => TextField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneTextController,
                  decoration: InputDecoration(
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                )),
            SizedBoxConst.size(context: context, size: 20),
            _titleText(context, title: 'Địa chỉ', subTitle: '*'),
            SizedBoxConst.size(context: context, size: 5),
            Row(
              children: [
                Expanded(
                    child: TextConstant.subTile3(context,
                        text: 'Thành Phố/ Tỉnh')),
                Expanded(
                    child: TextConstant.subTile3(context, text: 'Quận/ huyện')),
              ],
            ),
            SizedBoxConst.size(
              context: context,
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => onTapProvince(context),
                  child: Container(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(5, context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              BorderRadius.circular(UtilsReponsive.height(
                            5,
                            context,
                          ))),
                      child: Obx(() {
                        controller.dateCurrent.value;
                        return TextConstant.subTile3(context,
                            text: controller
                                    .selectedProvince.value.provinceName ??
                                'Chọn');
                      })),
                )),
                SizedBoxConst.sizeWith(context: context, size: 10),
                Expanded(
                    child: GestureDetector(
                  onTap: () => onTapDistrict(context),
                  child: Container(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(5, context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              BorderRadius.circular(UtilsReponsive.height(
                            5,
                            context,
                          ))),
                      child: Obx(() {
                        controller.dateCurrent.value;
                        return TextConstant.subTile3(context,
                            text: controller
                                    .selectedDistrict.value.districtName ??
                                'Chọn');
                      })),
                )),
              ],
            ),
            SizedBoxConst.size(context: context),
            TextConstant.subTile3(context, text: 'Phường/ Xã'),
            SizedBoxConst.size(
              context: context,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => onTapWard(context),
                    child: Container(
                        padding:
                            EdgeInsets.all(UtilsReponsive.height(5, context)),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.circular(UtilsReponsive.height(
                              5,
                              context,
                            ))),
                        child: Obx(() {
                          return TextConstant.subTile3(context,
                              text: controller.selectedWard.value.wardName ??
                                  'Chọn');
                        })),
                  ),
                ),
              ],
            ),
            TextField(
              controller: controller.addressTextController,
              decoration: const InputDecoration(
                hintText: 'Số nhà, tên đường',
              ),
            ),
            Obx(() => Visibility(
                  visible: controller.addressError.value.isNotEmpty,
                  child: Text(controller.addressError.value,
                      style: GoogleFonts.montserrat(
                          fontSize: UtilsReponsive.height(12, context),
                          fontWeight: FontWeight.w600,
                          color: Colors.red)),
                )),
            SizedBoxConst.size(context: context, size: 20),
            _titleText(context, title: 'Số CMND/CCCD', subTitle: ''),
            SizedBoxConst.size(context: context, size: 5),
            TextField(
              controller: controller.cccdTextController,
              keyboardType: TextInputType.number,
            ),
            Obx(
              () => Visibility(
                visible: controller.cccdError.value.isNotEmpty,
                child: GestureDetector(
                  onTap: () {
                    controller.resetCccd();
                  },
                  child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleSmall,
                          children: <TextSpan>[
                        TextSpan(
                            text: controller.cccdError.value,
                            style: GoogleFonts.montserrat(
                                fontSize: UtilsReponsive.height(12, context),
                                fontWeight: FontWeight.w600,
                                color: Colors.red)),
                        TextSpan(
                            text: 'vào đây',
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                fontSize: UtilsReponsive.height(12, context),
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ])),
                ),
              ),
            ),
            SizedBoxConst.size(context: context, size: 20),
            Row(
              children: [
                _titleText(context, title: 'Ngày hết hạn', subTitle: ''),
                SizedBoxConst.sizeWith(context: context, size: 5),
                GestureDetector(
                  onTap: () => onTapCccdDate(context),
                  child: Container(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(5, context)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              BorderRadius.circular(UtilsReponsive.height(
                            5,
                            context,
                          ))),
                      child: Obx(() {
                        controller.dateCCCDDate.value;
                        return TextConstant.subTile3(context,
                            text: controller.cccdDateTextController.text);
                      })),
                )
              ],
            ),
            SizedBoxConst.size(context: context, size: 20),
            _titleText(context, title: 'Nơi cấp', subTitle: ''),
            SizedBoxConst.size(context: context, size: 5),
            TextField(
              controller: controller.cccdAddressTextController,
            ),
          ],
        ),
      ),
    );
  }

  Container _pageInforMore(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                IconAssets.iconInformation,
                scale: 3,
              ),
              Expanded(
                child: TextConstant.titleH2(context, text: 'Thông tin khác'),
              ),
            ],
          ),
          SizedBoxConst.size(context: context, size: 5),
          TextConstant.subTile3(context,
              color: ColorsManager.primary,
              text:
                  'Cập nhật các thông tin sổ bảo hiểm, chỉ số sẽ giúp bạn có được sự chăm sóc chu đáo cũng như tối ưu về mặt chi phí ( Không bắt buộc )'),
          SizedBoxConst.size(context: context, size: 20),
          _titleText(context, title: 'Số BHYT', subTitle: ''),
          SizedBoxConst.size(context: context, size: 5),
          TextField(
            controller: controller.bhtyTextController,
            keyboardType: TextInputType.number,
          ),
          Obx(
            () => Visibility(
              visible: controller.bhtyError.value.isNotEmpty,
              child: GestureDetector(
                onTap: () {
                  controller.resetBhyt();
                },
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                          text: controller.bhtyError.value,
                          style: GoogleFonts.montserrat(
                              fontSize: UtilsReponsive.height(12, context),
                              fontWeight: FontWeight.w600,
                              color: Colors.red)),
                      TextSpan(
                          text: 'vào đây',
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              fontSize: UtilsReponsive.height(12, context),
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ])),
              ),
            ),
          ),
          SizedBoxConst.size(context: context, size: 20),
          Row(
            children: [
              _titleText(context, title: 'Ngày hết hạn', subTitle: ''),
              SizedBoxConst.sizeWith(context: context, size: 5),
              GestureDetector(
                onTap: () => onTapBHYTDate(context),
                child: Container(
                    padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            BorderRadius.circular(UtilsReponsive.height(
                          5,
                          context,
                        ))),
                    child: Obx(() {
                      controller.dateBHYTExp.value;
                      return TextConstant.subTile3(context,
                          text: controller.bhytExpTextController.text);
                    })),
              )
            ],
          ),
          SizedBoxConst.size(context: context, size: 20),
          _titleText(context, title: 'Nơi cấp', subTitle: ''),
          SizedBoxConst.size(context: context, size: 5),
          TextField(
            controller: controller.bhtyAddressTextController,
          ),
          SizedBoxConst.size(context: context, size: 20),
        ],
      ),
    );
  }

  RichText _titleText(BuildContext context,
      {required String title, required String subTitle,  String? textLimit}) {
    return RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall,
            children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: UtilsReponsive.height(16, context)),
          ),
          TextSpan(
            text: subTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.red,
                fontSize: UtilsReponsive.height(14, context)),
          ),
       
       TextSpan(
            text: textLimit??'',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontSize: UtilsReponsive.height(10, context)),
          )
        ]));
  }

  Container _buttonNext(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.height(50, context),
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
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
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          controller.ontapNext();
        },
      ),
    );
  }

  Container _buttonBack(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.height(50, context),
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
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
            'Trở lại',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: ColorsManager.primary,
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          controller.ontapBack();
        },
      ),
    );
  }

  Column _buttonCombo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttonBack(context),
        _buttonNext(context),
      ],
    );
  }

  onTapBirth(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày sinh',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: controller.dateCurrent.value,
              lastDate: DateTime.now().add(Duration(days: 30)),
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              controller.setValueBirth(value[0]!);
              Get.back();
            },
            value: [controller.dateCurrent.value],
          ),
        ));
  }

  onTapCccdDate(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày cấp',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: controller.dateCCCDDate.value,
              // lastDate: DateTime.now(),
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              controller.setValueCccdDate(value[0]!);
              Get.back();
            },
            value: [controller.dateCCCDDate.value],
          ),
        ));
  }

  onTapBHYTDate(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày hết hạn',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: controller.dateBHYTExp.value,
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              controller.setValueBhytDate(value[0]!);
              Get.back();
            },
            value: [controller.dateBHYTExp.value],
          ),
        ));
  }

  onTapProvince(BuildContext context) async {
    controller.fetchDataProvince();
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
          TextConstant.subTile1(Get.context!, text: 'Thành phố/ Tỉnh Thành'),
          Obx(
            () => controller.isFetchData.value
                ? CupertinoActivityIndicator()
                : Expanded(
                    child: ListView.builder(
                    itemCount: controller.listProvince.value.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.selectedProvince.value =
                            controller.listProvince[index];
                        Get.back();
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: UtilsReponsive.height(15, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextConstant.subTile2(context,
                                    text: controller
                                            .listProvince[index].provinceName ??
                                        ''),
                              ),
                              controller.listProvince[index].provinceId ==
                                      controller
                                          .selectedProvince.value.provinceId
                                  ? Icon(Icons.check)
                                  : SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
          )
        ],
      ),
    ));
  }

  onTapDistrict(BuildContext context) async {
    if (controller.selectedProvince.value.provinceId != null) {
      controller.fetchDataDistrict();
      await Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
              topRight:
                  Radius.circular(UtilsReponsive.height(10, Get.context!)),
            )),
        padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
        constraints:
            BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
        child: Column(
          children: [
            TextConstant.subTile1(Get.context!, text: 'Quận/ Huyện'),
            Obx(
              () => controller.isFetchData.value
                  ? CupertinoActivityIndicator()
                  : Expanded(
                      child: ListView.builder(
                      itemCount: controller.listDistrict.value.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          controller.selectedDistrict.value =
                              controller.listDistrict[index];
                          Get.back();
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                vertical: UtilsReponsive.height(15, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextConstant.subTile2(context,
                                      text: controller.listDistrict[index]
                                              .districtName ??
                                          ''),
                                ),
                                controller.listDistrict[index].districtId ==
                                        controller
                                            .selectedDistrict.value.districtId
                                    ? Icon(Icons.check)
                                    : SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
            )
          ],
        ),
      ));
    }
  }

  onTapWard(BuildContext context) async {
    if (controller.selectedDistrict.value.districtId != null) {
      controller.fetchDataWard();
      await Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
              topRight:
                  Radius.circular(UtilsReponsive.height(10, Get.context!)),
            )),
        padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
        constraints:
            BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
        child: Column(
          children: [
            TextConstant.subTile1(Get.context!, text: 'Phường/ Xã'),
            Obx(() => controller.isFetchData.value
                ? CupertinoActivityIndicator()
                : Expanded(
                    child: ListView.builder(
                    itemCount: controller.listWard.value.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.selectedWard.value =
                            controller.listWard[index];
                        Get.back();
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: UtilsReponsive.height(15, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextConstant.subTile2(context,
                                    text: controller.listWard[index].wardName ??
                                        ''),
                              ),
                              controller.listWard[index].wardCode ==
                                      controller.selectedWard.value.wardCode
                                  ? Icon(Icons.check)
                                  : SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )))
          ],
        ),
      ));
    }
  }
}
