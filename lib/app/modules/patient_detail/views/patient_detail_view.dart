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
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

import '../controllers/patient_detail_controller.dart';

class PatientDetailView extends BaseView<PatientDetailController> {
  const PatientDetailView({Key? key}) : super(key: key);
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
            title: "",
            traling: GestureDetector(
                onTap: () async {
                  await QuickAlert.show(
                      context: context, type: QuickAlertType.warning,
                      showConfirmBtn: true,
                      showCancelBtn: true,
                      confirmBtnText: 'Xác nhận',
                      cancelBtnText: 'Huỷ bỏ',
                      title: 'Xác nhận',
                      text: 'Bạn có chắc là muốn xoá thông tin bệnh nhân',
                      onConfirmBtnTap: () async{
                        await controller.deletePatient();
                      },
                      );
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                )),
          ),
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
                                GestureDetector(
                                    onTap: () {
                                      showBottomUpdateBasic(context);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: UtilsReponsive.height(20, context),
                                    ))
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
                                    '${controller.patient.value.weight ?? 'Chưa cập nhật'}'),
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
                                GestureDetector(
                                    onTap: () {
                                      showBottomUpdateAddress(context);
                                    },
                                    child: Icon(Icons.edit,
                                        size:
                                            UtilsReponsive.height(20, context)))
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
                                GestureDetector(
                                  onTap: () {
                                    showBottomUpdateInsurance(context);
                                  },
                                  child: Icon(Icons.edit,
                                      size: UtilsReponsive.height(20, context)),
                                )
                              ],
                            ),
                            _dividerColor(context),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Số BHYT',
                                content: controller
                                        .patient.value.healthInsuranceCode ??
                                    'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Ngày hết hạn',
                                content:
                                    controller.patient.value.idIssuedDate !=
                                            null
                                        ? DateFormat('dd-MM-yyyy').format(
                                            DateTime.parse(controller
                                                .patient.value.idIssuedDate!))
                                        : 'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Địa chỉ cấp',
                                content:
                                    controller.patient.value.hiIssuedPlace ??
                                        'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConstant.subTile1(
                                  context,
                                  text: 'Thẻ Căn Cước / CMND',
                                ),
                                // Icon(Icons.edit,
                                //     size: UtilsReponsive.height(20, context))
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
                                content:
                                    controller.patient.value.idIssuedDate !=
                                            null
                                        ? DateFormat('dd-MM-yyyy').format(
                                            DateTime.parse(controller
                                                .patient.value.idIssuedDate!))
                                        : 'Chưa cập nhật'),
                            SizedBoxConst.size(context: context, size: 15),
                            _textData(context,
                                title: 'Địa chỉ cấp',
                                content:
                                    controller.patient.value.idIssuedPlace ??
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

  showBottomUpdateAddress(BuildContext context) {
    Get.bottomSheet(
        Container(
            padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
            width: double.infinity,
            height: UtilsReponsive.height(400, context),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(UtilsReponsive.height(20, context)),
                  topRight: Radius.circular(UtilsReponsive.height(20, context)),
                )),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextConstant.subTile3(context,
                              text: 'Thành Phố/ Tỉnh')),
                      Expanded(
                          child: TextConstant.subTile3(context,
                              text: 'Quận/ huyện')),
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
                            padding: EdgeInsets.all(
                                UtilsReponsive.height(5, context)),
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
                                  text: controller.selectedProvince.value
                                          .provinceName ??
                                      'Chọn');
                            })),
                      )),
                      SizedBoxConst.sizeWith(context: context, size: 10),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => onTapDistrict(context),
                        child: Container(
                            padding: EdgeInsets.all(
                                UtilsReponsive.height(5, context)),
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
                                  text: controller.selectedDistrict.value
                                          .districtName ??
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
                              padding: EdgeInsets.all(
                                  UtilsReponsive.height(5, context)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(
                                      UtilsReponsive.height(
                                    5,
                                    context,
                                  ))),
                              child: Obx(() {
                                return TextConstant.subTile3(context,
                                    text: controller
                                            .selectedWard.value.wardName ??
                                        'Chọn');
                              })),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: controller.addressLineTextController,
                    decoration: const InputDecoration(
                      hintText: 'Số nhà, tên đường',
                    ),
                  ),
                  SizedBoxConst.size(context: context),
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(ColorsManager.primary),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: TextConstant.subTile2(
                          context,
                          text: 'Cập nhật',
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          await controller.updateAddressPatient();
                        },
                      )),
                ]))),
        isDismissible: false);
  }

  showBottomUpdateBasic(BuildContext context) {
    controller.heightController.text =
        '${controller.patient.value.height ?? '0'}';
    controller.weightController.text =
        '${controller.patient.value.height ?? '0'}';
    controller.phoneTextController.text =
        controller.patient.value.phoneNumber ?? '0';

    Get.bottomSheet(Container(
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      width: double.infinity,
      height: UtilsReponsive.height(400, context),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilsReponsive.height(20, context)),
            topRight: Radius.circular(UtilsReponsive.height(20, context)),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextConstant.titleH3(context, text: 'Chiều cao:'),
            SizedBoxConst.size(context: context),
            FormFieldWidget(
              controllerEditting: controller.heightController,
              padding: 20,
              setValueFunc: (value) {},
              borderColor: ColorsManager.primary,
              radiusBorder: 15,
            ),
            SizedBoxConst.size(context: context),
            TextConstant.titleH3(context, text: 'Cân nặng:'),
            SizedBoxConst.size(context: context),
            FormFieldWidget(
              controllerEditting: controller.weightController,
              padding: 20,
              textInputType: TextInputType.number,
              setValueFunc: (value) {},
              borderColor: ColorsManager.primary,
              radiusBorder: 15,
            ),
            SizedBoxConst.size(context: context),
            TextConstant.titleH3(context, text: 'Số điện thoại'),
            SizedBoxConst.size(context: context),
            FormFieldWidget(
              controllerEditting: controller.phoneTextController,
              padding: 20,
              textInputType: TextInputType.number,
              setValueFunc: (value) {},
              borderColor: ColorsManager.primary,
              radiusBorder: 15,
            ),
            SizedBoxConst.size(context: context),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: context.width),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorsManager.primary),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                  ),
                  child: TextConstant.subTile2(
                    context,
                    text: 'Cập nhật',
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await controller.updateBasicPatient();
                  },
                )),
          ],
        ),
      ),
    ));
  }

  showBottomUpdateInsurance(BuildContext context) {
    controller.heightController.text =
        '${controller.patient.value.height ?? '0'}';
    controller.weightController.text =
        '${controller.patient.value.height ?? '0'}';
    controller.phoneTextController.text =
        controller.patient.value.phoneNumber ?? '0';

    Get.bottomSheet(
        Container(
          padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
          width: double.infinity,
          height: UtilsReponsive.height(400, context),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(UtilsReponsive.height(20, context)),
                topRight: Radius.circular(UtilsReponsive.height(20, context)),
              )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          Get.back();
                          await controller.initData();
                        },
                        child: Icon(Icons.close))
                  ],
                ),
                SizedBoxConst.size(context: context),
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
                                    fontSize:
                                        UtilsReponsive.height(12, context),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red)),
                            TextSpan(
                                text: 'vào đây',
                                style: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    fontSize:
                                        UtilsReponsive.height(12, context),
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
                ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(ColorsManager.primary),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: TextConstant.subTile2(
                        context,
                        text: 'Cập nhật',
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await controller.updateInsurance();
                      },
                    )),
              ],
            ),
          ),
        ),
        isDismissible: false);
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
                await controller.pickImageFromCategory();
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

  Container _dividerColor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: UtilsReponsive.height(5, context)),
      width: UtilsReponsive.height(120, context),
      height: UtilsReponsive.height(2, context),
      color: ColorsManager.primary,
    );
  }

  RichText _titleText(BuildContext context,
      {required String title, required String subTitle, String? textLimit}) {
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
            text: textLimit ?? '',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontSize: UtilsReponsive.height(10, context)),
          )
        ]));
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
