import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
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
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarCustom(
              callback: () {
                Get.back();
              },
              title: "Hồ sơ mới"),
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: UtilsReponsive.height(10, context)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  ColorsManager.primary,
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
                            fontSize:
                                UtilsReponsive.formatFontSize(12, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async {},
                  ),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
