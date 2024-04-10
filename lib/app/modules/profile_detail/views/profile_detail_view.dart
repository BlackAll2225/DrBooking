import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends BaseView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    controller.dateCurrent.value;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarCustom(
              callback: () {
                Get.back();
              },
              title: "Hồ sơ"),
          Obx(
            () => controller.isLoading.value
                ? LoadingWidget()
                : Expanded(
                    child: SingleChildScrollView(
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
                              fillColor:
                                  ColorsManager.primary.withOpacity(0.15),
                              setValueFunc: (value) {}),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBoxConst.size(context: context, size: 20),
                                _titleText(context,
                                    title: 'Ngày sinh', subTitle: '*'),
                                SizedBoxConst.size(context: context),
                                GestureDetector(
                                  onTap: () async {
                                    if (!controller.isLockUpdate.value) {
                                      await controller.onTapBirth(context);
                                    }
                                  },
                                  child: FormFieldWidget(
                                      isEnabled: false,
                                      controllerEditting:
                                          controller.birthTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
                                      setValueFunc: (value) {}),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBoxConst.size(context: context, size: 20),
                                _titleText(context,
                                    title: 'Giới tính', subTitle: '*'),
                                SizedBoxConst.size(context: context),
                                GestureDetector(
                                  onTap: () {
                                    if (!controller.isLockUpdate.value) {
                                      controller.onTapGender();
                                    }
                                  },
                                  child: FormFieldWidget(
                                      isEnabled: false,
                                      controllerEditting:
                                          controller.genderTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
                                      setValueFunc: (value) {}),
                                )
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
                              controllerEditting:
                                  controller.addressTextController,
                              radiusBorder: 15,
                              padding: 15,
                              fillColor:
                                  ColorsManager.primary.withOpacity(0.15),
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
                                _titleText(context,
                                    title: 'Số BHYT', subTitle: ''),
                                SizedBoxConst.size(context: context),
                                Obx(
                                  () => FormFieldWidget(
                                      isEnabled: !controller.isLockUpdate.value,
                                      controllerEditting:
                                          controller.bhtyTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
                                      setValueFunc: (value) {}),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBoxConst.size(context: context, size: 20),
                                _titleText(context,
                                    title: 'Ngày hết hạn', subTitle: ''),
                                SizedBoxConst.size(context: context),
                                GestureDetector(
                                  onTap: () {
                                    controller.onTapBHYTExpDate(context);
                                  },
                                  child: FormFieldWidget(
                                      isEnabled: false,
                                      controllerEditting:
                                          controller.bhytExpTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
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
                              controllerEditting:
                                  controller.bhtyAddressTextController,
                              radiusBorder: 15,
                              padding: 15,
                              fillColor:
                                  ColorsManager.primary.withOpacity(0.15),
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
                                _titleText(context,
                                    title: 'Số CCCD/ CMND', subTitle: ''),
                                SizedBoxConst.size(context: context),
                                Obx(
                                  () => FormFieldWidget(
                                      isEnabled: !controller.isLockUpdate.value,
                                      controllerEditting:
                                          controller.cccdTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
                                      setValueFunc: (value) {}),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBoxConst.size(context: context, size: 20),
                                _titleText(context,
                                    title: 'Ngày cấp', subTitle: ''),
                                SizedBoxConst.size(context: context),
                                GestureDetector(
                                  onTap: () {
                                    if (!controller.isLockUpdate.value) {
                                      controller.onTapCCCDDate(context);
                                    }
                                  },
                                  child: FormFieldWidget(
                                      isEnabled: false,
                                      controllerEditting:
                                          controller.cccdDateTextController,
                                      radiusBorder: 15,
                                      padding: 15,
                                      fillColor: ColorsManager.primary
                                          .withOpacity(0.15),
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
                              controllerEditting:
                                  controller.cccdAddressTextController,
                              radiusBorder: 15,
                              padding: 15,
                              fillColor:
                                  ColorsManager.primary.withOpacity(0.15),
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
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: UtilsReponsive.paddingOnly(
                                          context,
                                          top: 15,
                                          bottom: 15),
                                    ),

                                    // ignore: sort_child_properties_last
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: TextConstant.subTile3(context,
                                          text: 'Chỉnh sửa thông tin',
                                          color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      controller.onTapEdit();
                                    },
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color:
                                                        ColorsManager.primary),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            padding: UtilsReponsive.paddingOnly(
                                                context,
                                                top: 15,
                                                bottom: 15),
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
                                            backgroundColor:
                                                ColorsManager.primary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            padding: UtilsReponsive.paddingOnly(
                                                context,
                                                top: 15,
                                                bottom: 15),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: TextConstant.subTile3(
                                                context,
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
                  )),
          )
        ],
      )),
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
}
