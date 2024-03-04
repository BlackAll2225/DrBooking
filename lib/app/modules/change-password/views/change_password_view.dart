import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends BaseView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
       
        body: SafeArea(
          child: Column(
            children: [
              AppBarCustom(callback: (){Get.back();}, title: 'Cập Nhật Mật Khẩu'),
              Expanded(
                child: Material(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                            child: Text(
                              "Mật khẩu cũ",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: UtilsReponsive.formatFontSize(13, context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: UtilsReponsive.paddingOnly(context,
                                top: 20, right: 20, left: 20),
                            child: Obx(()=>
                            TextFormField(
                                obscureText: true,
                                onChanged: (value) {},
                                textInputAction: TextInputAction.done,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: UtilsReponsive.formatFontSize(13, context),
                                    fontWeight: FontWeight.w600),
                                cursorColor: ColorsManager.primary,
                                controller: controller.oldPasswordController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    errorText: controller.errorOldPassword.value.isNotEmpty
                                        ? controller.errorOldPassword.value
                                        : null,
                                    hintStyle: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize:
                                            UtilsReponsive.formatFontSize(13, context),
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: ColorsManager.primary,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(10, context),
                          ),
                          Padding(
                            padding:
                                UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                            child: Text(
                              "Mật khẩu mới",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: UtilsReponsive.formatFontSize(13, context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: UtilsReponsive.paddingOnly(context,
                                top: 20, right: 20, left: 20),
                            child: Obx(()=>
                            TextFormField(
                                obscureText: true,
                                onChanged: (value) {},
                                textInputAction: TextInputAction.done,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: UtilsReponsive.formatFontSize(13, context),
                                    fontWeight: FontWeight.w600),
                                cursorColor: ColorsManager.primary,
                                controller: controller.newPasswordController,
                                keyboardType: TextInputType.text,
                                // Get.find<StartAppController>().name.toString(),
                                decoration: InputDecoration(
                                    errorText: controller.errorPassword.value.isNotEmpty
                                        ? controller.errorPassword.value
                                        : null,
                                    hintStyle: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize:
                                            UtilsReponsive.formatFontSize(13, context),
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2), width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: ColorsManager.primary,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(10, context),
                          ),
                          Padding(
                            padding:
                                UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                            child: Text(
                              "Nhập lại mật khẩu mới",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: UtilsReponsive.formatFontSize(13, context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: UtilsReponsive.paddingOnly(context,
                                top: 20, right: 20, left: 20),
                            child: Obx(
                              () => TextFormField(
                                obscureText: true,
                                controller: controller.rePasswordController,
                                onChanged: (value) {},
                                textInputAction: TextInputAction.done,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize:
                                        UtilsReponsive.formatFontSize(13, context),
                                    fontWeight: FontWeight.w600),
                                cursorColor: ColorsManager.primary,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    errorText: controller.errorPassword.value.isNotEmpty
                                        ? controller.errorPassword.value
                                        : null,
                                    hintStyle: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize:
                                            UtilsReponsive.formatFontSize(13, context),
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: ColorsManager.primary,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: UtilsReponsive.height(10, context),
                          ),
                          Padding(
                            padding: UtilsReponsive.paddingOnly(context,
                                top: 50, left: 20, right: 20, bottom: 50),
                            child: ElevatedButton(
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
                                child: Text(
                                  'Lưu Thay Đổi',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize:
                                          UtilsReponsive.formatFontSize(13, context),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () async {
                            await    controller.changePassword();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
