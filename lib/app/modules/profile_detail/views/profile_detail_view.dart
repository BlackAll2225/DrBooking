import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends BaseView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    controller.dateCurrent.value;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarCustom(
              callback: () {
                Get.back();
              },
              title: ""),
          Obx(
            () => controller.isLoading.value
                ? LoadingWidget()
                : Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                    children: [
                      SizedBoxConst.size(context: context, size: 20),
                      Obx(() => _avatar(context)),
                      SizedBoxConst.size(context: context),
                      TextConstant.titleH2(context,
                          text: controller.patient.value.fullname!),
                      TextConstant.subTile2(context,
                          text: controller.patient.value.dateOfBirth!.year
                              .toString(),
                          color: Colors.grey),
                      SizedBoxConst.size(context: context),
                      Padding(
                        padding:
                            EdgeInsets.all(UtilsReponsive.height(15, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConstant.subTile1(
                                  context,
                                  text: 'Thông tin cá nhân',
                                ),
                                Icon(Icons.edit)
                              ],
                            ),
                            _dividerColor(context),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Chiều cao',
                                content:
                                    '${controller.patient.value.height ?? 'Chưa cập nhật'}'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Cân nặng',
                                content:
                                    '${controller.patient.value.height ?? 'Chưa cập nhật'}'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Số điện thoại',
                                content: controller.patient.value.phoneNumber ??
                                    'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConstant.subTile1(
                                  context,
                                  text: 'Địa chỉ',
                                ),
                                Icon(Icons.edit)
                              ],
                            ),
                            _dividerColor(context),
                            SizedBoxConst.size(context: context, size: 15),
                            TextConstant.subTile2(context,
                                text: controller.addressTextController.text,
                                color: Colors.black87),
                            SizedBoxConst.size(context: context, size: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConstant.subTile1(
                                  context,
                                  text: 'Thông tin bảo hiểm',
                                ),
                                Icon(Icons.edit)
                              ],
                            ),
                            _dividerColor(context),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Số BHYT',
                                content: controller.patient.value.healthInsuranceCode ??
                                    'Chưa cập nhật'),
                             SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Ngày hết hạn',
                                content: controller.patient.value.idIssuedDate!=null? 
                                DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.patient.value.idIssuedDate!)):
                                    'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Địa chỉ cấp',
                                content: controller.patient.value.hiIssuedPlace??
                                    'Chưa cập nhật'),
                               SizedBoxConst.size(context: context, size: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConstant.subTile1(
                                  context,
                                  text: 'Thẻ Căn Cước / CMND',
                                ),
                                Icon(Icons.edit)
                              ],
                            ),
                            _dividerColor(context),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Số CCCD/CMND',
                                content: controller.patient.value.idCode ??
                                    'Chưa cập nhật'),
                             SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Ngày cấp',
                                content: controller.patient.value.idIssuedDate!=null? 
                                DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.patient.value.idIssuedDate!)):
                                    'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Địa chỉ cấp',
                                content: controller.patient.value.idIssuedPlace??
                                    'Chưa cập nhật'),
                            
                          ],
                        ),
                      )
                    ],
                  ))),
          )
        ],
      )),
    );
  }

  Row _textData(BuildContext context,
      {required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextConstant.subTile2(context,
                text: title, color: Colors.black87)),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(90, context),
      width: UtilsReponsive.height(90, context),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: UtilsReponsive.height(90, context),
            width: UtilsReponsive.height(90, context),
            padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.primary),
                shape: BoxShape.circle),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: UtilsReponsive.height(80, context),
              width: UtilsReponsive.height(80, context),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: controller.patient.value.avatarUrl ?? '',
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: Colors.white,
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(ImageAssets.logo),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                //  await controller.pickImageFromCategory();
              },
              child: Container(
                padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ], color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.camera_alt,
                  size: UtilsReponsive.height(14, context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  SingleChildScrollView bk1(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextConstant.subTile1(
            context,
            text: 'Thông tin cá nhân',
          ),
          _dividerColor(context),
          SizedBoxConst.size(context: context, size: 20),
          _titleText(context, title: 'Họ và tên', subTitle: '*'),
          SizedBoxConst.size(context: context),
          Obx(
            () => FormFieldWidget(
                isEnabled: !controller.isLockUpdate.value,
                controllerEditting: controller.nameTextController,
                radiusBorder: 15,
                padding: 15,
                fillColor: ColorsManager.primary.withOpacity(0.15),
                setValueFunc: (value) {}),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Ngày sinh', subTitle: '*'),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () async {
                      if (!controller.isLockUpdate.value) {
                        await onTapBirth(context);
                      }
                    },
                    child: FormFieldWidget(
                        isEnabled: false,
                        controllerEditting: controller.birthTextController,
                        radiusBorder: 15,
                        padding: 15,
                        fillColor: ColorsManager.primary.withOpacity(0.15),
                        setValueFunc: (value) {}),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Giới tính', subTitle: '*'),
                  SizedBoxConst.sizeWith(context: context, size: 10),
                  Obx(() => IgnorePointer(
                        ignoring: true,
                        child: DropdownButton<Gender>(
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
                        ),
                      ))
                ],
              ))
            ],
          ),
          SizedBoxConst.size(context: context, size: 20),
          _titleText(context, title: 'Địa chỉ', subTitle: '*'),
          SizedBoxConst.size(context: context),
          Obx(
            () => FormFieldWidget(
                isEnabled: !controller.isLockUpdate.value,
                controllerEditting: controller.addressTextController,
                radiusBorder: 15,
                padding: 15,
                fillColor: ColorsManager.primary.withOpacity(0.15),
                setValueFunc: (value) {}),
          ),
          SizedBoxConst.size(context: context, size: 20),
          TextConstant.subTile1(
            context,
            text: 'Thông tin khác',
          ),
          _dividerColor(context),
          SizedBoxConst.size(context: context),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Số BHYT', subTitle: ''),
                  SizedBoxConst.size(context: context),
                  Obx(
                    () => FormFieldWidget(
                        isEnabled: !controller.isLockUpdate.value,
                        controllerEditting: controller.bhtyTextController,
                        radiusBorder: 15,
                        padding: 15,
                        fillColor: ColorsManager.primary.withOpacity(0.15),
                        setValueFunc: (value) {}),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Ngày hết hạn', subTitle: ''),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () {
                      onTapBHYTDate(context);
                    },
                    child: FormFieldWidget(
                        isEnabled: false,
                        controllerEditting: controller.bhytExpTextController,
                        radiusBorder: 15,
                        padding: 15,
                        fillColor: ColorsManager.primary.withOpacity(0.15),
                        setValueFunc: (value) {}),
                  )
                ],
              ))
            ],
          ),
          SizedBoxConst.size(context: context, size: 20),
          _titleText(context, title: 'Nơi cấp', subTitle: ''),
          SizedBoxConst.size(context: context),
          Obx(
            () => FormFieldWidget(
                isEnabled: !controller.isLockUpdate.value,
                controllerEditting: controller.bhtyAddressTextController,
                radiusBorder: 15,
                padding: 15,
                fillColor: ColorsManager.primary.withOpacity(0.15),
                setValueFunc: (value) {}),
          ),
          SizedBoxConst.size(
            context: context,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Số CCCD/ CMND', subTitle: ''),
                  SizedBoxConst.size(context: context),
                  Obx(
                    () => FormFieldWidget(
                        isEnabled: !controller.isLockUpdate.value,
                        controllerEditting: controller.cccdTextController,
                        radiusBorder: 15,
                        padding: 15,
                        fillColor: ColorsManager.primary.withOpacity(0.15),
                        setValueFunc: (value) {}),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 20),
                  _titleText(context, title: 'Ngày cấp', subTitle: ''),
                  SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () {
                      if (!controller.isLockUpdate.value) {
                        onTapCccdDate(context);
                      }
                    },
                    child: FormFieldWidget(
                        isEnabled: false,
                        controllerEditting: controller.cccdDateTextController,
                        radiusBorder: 15,
                        padding: 15,
                        fillColor: ColorsManager.primary.withOpacity(0.15),
                        setValueFunc: (value) {}),
                  )
                ],
              ))
            ],
          ),
          SizedBoxConst.size(
            context: context,
          ),
          _titleText(context, title: 'Nơi cấp', subTitle: ''),
          SizedBoxConst.size(context: context),
          Obx(
            () => FormFieldWidget(
                isEnabled: !controller.isLockUpdate.value,
                controllerEditting: controller.cccdAddressTextController,
                radiusBorder: 15,
                padding: 15,
                fillColor: ColorsManager.primary.withOpacity(0.15),
                setValueFunc: (value) {}),
          ),
          SizedBoxConst.size(context: context),
          Padding(
              padding: UtilsReponsive.paddingOnly(context,
                  top: 50, left: 20, right: 20, bottom: 50),
              child: Obx(() => controller.isLockUpdate.value
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: UtilsReponsive.paddingOnly(context,
                            top: 15, bottom: 15),
                      ),

                      // ignore: sort_child_properties_last
                      child: Container(
                        alignment: Alignment.center,
                        child: TextConstant.subTile3(context,
                            text: 'Chỉnh sửa thông tin', color: Colors.white),
                      ),
                      onPressed: () async {
                        controller.onTapEdit();
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: ColorsManager.primary),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 15, bottom: 15),
                            ),

                            // ignore: sort_child_properties_last
                            child: Container(
                              alignment: Alignment.center,
                              child: TextConstant.subTile3(
                                context,
                                text: 'Huỷ bỏ',
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.primary,
                              ),
                            ),
                            onPressed: () async {
                              // controller.onTapEdit();
                            },
                          ),
                        ),
                        SizedBoxConst.sizeWith(context: context),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 15, bottom: 15),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: TextConstant.subTile3(context,
                                  text: 'Cập nhật',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              await controller.onTapUpdate();
                            },
                          ),
                        ),
                      ],
                    ))),
        ],
      ),
    );
  }

  Container _dividerColor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: UtilsReponsive.height(5, context)),
      width: UtilsReponsive.height(120, context),
      height: UtilsReponsive.height(2, context),
      color: ColorsManager.primary,
    );
  }

  RichText _titleText(BuildContext context,
      {required String title, required String subTitle}) {
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
        ]));
  }

  onTapBirth(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày cấp',
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
              lastDate: DateTime.now(),
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
