import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/personal_information_controller.dart';

class PersonalInformationView extends BaseView<PersonalInformationController> {
  const PersonalInformationView({Key? key}) : super(key: key);

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
                title: 'Cập Nhật Tài Khoản'),
            SizedBoxConst.size(context: context, size: 20),
            Expanded(
              child: Obx(() =>controller.isLoading.value?
              Center(
                child: LoadingWidget()
              )
              : Material(
                    child: Container(
                      width: UtilsReponsive.width(
                        375,
                        context,
                      ),
                      height: UtilsReponsive.height(
                        812,
                        context,
                      ),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.isLoading.value == true
                                ? SizedBox()
                                : SizedBox(),
                            Center(
                              child: Container(
                                height: UtilsReponsive.height(80, context),
                                width: UtilsReponsive.height(80, context),
                                decoration: BoxDecoration(
                                    color: ColorsManager.primary,
                                    shape: BoxShape.circle),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: controller.account.value.avatarUrl,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(ImageAssets.logo),
                                ),
                              ),
                            ),
                            Padding(
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 30, left: 20),
                              child: TextConstant.subTile3(
                                context,
                                text: "Họ & Tên",
                              ),
                            ),
                            Padding(
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 20, right: 20, left: 20),
                              child: FormFieldWidget(
                                 borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  isEnabled: !controller.isLockUpdate.value,
                                  setValueFunc: (v) {},
                                  initValue: controller.account.value.fullname,
                                  icon: Icon(Icons.person)),
                            ),
                            Padding(
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 30, left: 20),
                              child: TextConstant.subTile3(
                                context,
                                text: "Email",
                              ),
                            ),
                            Padding(
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 20, right: 20, left: 20),
                              child: FormFieldWidget(
                                 borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  isEnabled: !controller.isLockUpdate.value,
                                  setValueFunc: (v) {},
                                  initValue: controller.account.value.email,
                                  icon: Icon(Icons.email)),
                            ),
                            Padding(
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 30, left: 20),
                              child: TextConstant.subTile3(
                                context,
                                text: "Số Điện Thoại",
                              ),
                            ),
                            Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                  borderColor: Colors.grey,
                                  radiusBorder: 10,
                                    isEnabled: !controller.isLockUpdate.value,
                                    setValueFunc: (v) {},
                                    initValue:
                                        controller.account.value.phoneNumber,
                                    icon: Icon(Icons.phone))),
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
                                                controller.onTapEdit();
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
                                                controller.onTapEdit();
                                              },
                                            ),
                                          ),
                                        ],
                                      ))),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
