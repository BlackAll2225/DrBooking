import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/new_profile_controller.dart';

class ConfirmProfileView extends BaseView<NewProfileController> {
  const ConfirmProfileView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:_buttonCreate(context),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppBarCustom(
            callback: () {
              Get.back();
            },
            title: "Xác nhận"),
        Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
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
                    child: TextConstant.titleH3(context,
                        text: 'Thông tin cá nhân'),
                  ),
                ],
              ),
              SizedBoxConst.size(context: context, size: 20),
              _rowText(context,title: 'Họ và tên:',content: controller.nameTextController.text),
               SizedBoxConst.size(context: context),
              _rowText(context,title: 'Năm sinh:',content: controller.birthTextController.text),
                SizedBoxConst.size(context: context),
              _rowText(context,title: 'Giới tính',content: controller.selectedGender.value.name),
               SizedBoxConst.size(context: context),
              _rowText(context,title: 'Số điện thoại:',content: controller.phoneTextController.text),
               SizedBoxConst.size(context: context),
              _rowText(context,title: 'Địa chỉ',content: controller.addressTextController.text + ' ${controller.selectedWard.value.wardName}, ${controller.selectedDistrict.value.districtName}, ${controller.selectedProvince.value.provinceName}'),
              // TextConstant.subTile1(context, text: controller.addressTextController.text + ' ${controller.selectedWard.value.wardName}, ${controller.selectedDistrict.value.districtName}, ${controller.selectedProvince.value.provinceName}', fontWeight: FontWeight.bold),
               SizedBoxConst.size(context: context),
                Visibility(
                  visible: controller.cccdTextController.text.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:MainAxisSize.min,
                  children: [
                    _rowText(context,title: 'Số CCCD',content: controller.cccdTextController.text.isEmpty?"Chưa cập nhật":controller.cccdTextController.text),
                    SizedBoxConst.size(context: context),
                    _rowText(context,title: 'Ngày cấp',content: controller.cccdDateTextController.text == 'Chọn' ?"Chưa cập nhật":controller.cccdDateTextController.text),
                    SizedBoxConst.size(context: context),
                    _rowText(context,title: 'Nơi cấp',content: controller.cccdAddressTextController.text),
                    SizedBoxConst.size(context: context),
                  ],
                               ),
                ),
                  Visibility(
                  visible: controller.bhtyTextController.text.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:MainAxisSize.min,
                  children: [
                    _rowText(context,title: 'Số BHYT',content: controller.bhtyTextController.text.isEmpty?"Chưa cập nhật":controller.cccdTextController.text),
                    SizedBoxConst.size(context: context),
                    _rowText(context,title: 'Ngày hêt hạn',content: controller.bhytExpTextController.text == 'Chọn' ?"Chưa cập nhật":controller.bhytExpTextController.text),
                    SizedBoxConst.size(context: context),
                    _rowText(context,title: 'Nơi cấp',content:  controller.bhtyAddressTextController.text),
                    SizedBoxConst.size(context: context),
                  ],
                               ),
                )
            ],
          ),
        ))
      ])),
    );
  }

  Row _rowText(BuildContext context, {required String title, required String content}) {
    return Row(
              children: [
                Expanded(child: TextConstant.subTile1(context, text: title, color: Colors.black45)),
                Expanded(
                  child: TextConstant.subTile1(context, text: content, fontWeight: FontWeight.w600)),
              ],
            );
  }
  Container _buttonCreate(
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
            'Tạo hồ sơ',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          await controller.createProfile();
        },
      ),
    );
  }
}
