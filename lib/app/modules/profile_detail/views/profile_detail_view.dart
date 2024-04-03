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
              
          Obx(()=>controller.isLoading.value?LoadingWidget():
          Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConstant.subTile1(
                    context,
                    text: 'Thông tin cá nhân',
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                    width: UtilsReponsive.height(120, context),
                    height: UtilsReponsive.height(2, context),
                    color: ColorsManager.primary,
                  ),
                  SizedBoxConst.size(context: context, size: 20),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleSmall,
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Họ và tên',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: UtilsReponsive.height(16, context)),
                        ),
                        TextSpan(
                          text: '*',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.red,
                              fontSize: UtilsReponsive.height(14, context)),
                        ),
                      ])),
                  SizedBoxConst.size(context: context),
                  FormFieldWidget(
                      controllerEditting: controller.nameTextController,
                      radiusBorder: 15,
                      padding: 15,
                      fillColor: ColorsManager.primary.withOpacity(0.15),
                      setValueFunc: (value) {}),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBoxConst.size(context: context, size: 20),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Ngày sinh',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
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
                            onTap: ()async {
                            await  controller.onTapBirth(context);
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
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Giới tính',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
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
                                onTap: () {
                                  controller.onTapGender();
                                },
                            child: FormFieldWidget(
                              isEnabled: false,
                              controllerEditting: controller.genderTextController,
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
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleSmall,
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Địa chỉ',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: UtilsReponsive.height(16, context)),
                        ),
                        TextSpan(
                          text: '*',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.red,
                              fontSize: UtilsReponsive.height(14, context)),
                        ),
                      ])),
                  SizedBoxConst.size(context: context),
                  FormFieldWidget(
                    controllerEditting: controller.addressTextController,
                      radiusBorder: 15,
                      padding: 15,
                      fillColor: ColorsManager.primary.withOpacity(0.15),
                      setValueFunc: (value) {}),
                  SizedBoxConst.size(context: context, size: 20),
                  TextConstant.subTile1(
                    context,
                    text: 'Thông tin khác',
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                    width: UtilsReponsive.height(120, context),
                    height: UtilsReponsive.height(2, context),
                    color: ColorsManager.primary,
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBoxConst.size(context: context, size: 20),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Số BHYT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
                                ),
                              ])),
                          SizedBoxConst.size(context: context),
                          FormFieldWidget(
                            controllerEditting: controller.bhtyTextController,
                              radiusBorder: 15,
                              padding: 15,
                              fillColor: ColorsManager.primary.withOpacity(0.15),
                              setValueFunc: (value) {})
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBoxConst.size(context: context, size: 20),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Ngày hết hạn',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
                                ),
                              ])),
                          SizedBoxConst.size(context: context),
                          GestureDetector(
                                onTap: () {
                                  controller.onTapBHYTExpDate(context);
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
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleSmall,
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Nơi cấp',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: UtilsReponsive.height(16, context)),
                        ),
                      ])),
                  SizedBoxConst.size(context: context),
                  FormFieldWidget(
                    controllerEditting: controller.bhtyAddressTextController,
                      radiusBorder: 15,
                      padding: 15,
                      fillColor: ColorsManager.primary.withOpacity(0.15),
                      setValueFunc: (value) {}),
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
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Số CCCD/CMND',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
                                ),
                               
                              ])),
                          SizedBoxConst.size(context: context),
                          FormFieldWidget(
                            controllerEditting: controller.cccdTextController,
                              radiusBorder: 15,
                              padding: 15,
                              fillColor: ColorsManager.primary.withOpacity(0.15),
                              setValueFunc: (value) {})
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBoxConst.size(context: context, size: 20),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall,
                                  children: <TextSpan>[
                                TextSpan(
                                  text: 'Ngày cấp',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              UtilsReponsive.height(16, context)),
                                ),
                               
                              ])),
                          SizedBoxConst.size(context: context),
                          GestureDetector(
                            onTap: () {
                              controller.onTapCCCDDate(context);
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
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.titleSmall,
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Nơi cấp',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: UtilsReponsive.height(16, context)),
                        ),
                      ])),
                  SizedBoxConst.size(context: context),
                  FormFieldWidget(
                    controllerEditting: controller.cccdAddressTextController,
                      radiusBorder: 15,
                      padding: 15,
                      fillColor: ColorsManager.primary.withOpacity(0.15),
                      setValueFunc: (value) {}),
                  SizedBoxConst.size(context: context),
                   Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 50, left: 20, right: 20, bottom: 50),
                                child: Obx(() => controller.isLockUpdate.value
                                    ? ElevatedButton(
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

                                        // ignore: sort_child_properties_last
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Chỉnh sửa thông tin',
                                            textAlign: TextAlign.center,
                                          ),
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
                                                backgroundColor:
                                                    Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(color: ColorsManager.primary),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                padding:
                                                    UtilsReponsive.paddingOnly(
                                                        context,
                                                        top: 15,
                                                        bottom: 15),
                                              ),

                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: TextConstant.subTile3(context,text:
                                                  'Huỷ bỏ',
                                                  color: ColorsManager.primary,
                                                ),
                                              ),
                                              onPressed: () async {
                                                // controller.onTapEdit();
                                              },
                                            ),
                                          ),
                                          SizedBoxConst.sizeWith(
                                              context: context),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ColorsManager.primary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                padding:
                                                    UtilsReponsive.paddingOnly(
                                                        context,
                                                        top: 15,
                                                        bottom: 15),
                                              ),

                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Cập nhật',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              onPressed: () async {
                                                // controller.onTapEdit();
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
}
