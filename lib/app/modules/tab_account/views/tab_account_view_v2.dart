import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/nav_account.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tab_account_controller.dart';

class TabAccountViewV2 extends BaseView<TabAccountController> {
  const TabAccountViewV2({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return SafeArea(
      child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
               SizedBoxConst.size(context: context,size: 20),
               Obx(()=> _avatar(context)),
                SizedBoxConst.size(context: context),
                TextConstant.titleH2(context,
                    text: controller.account.value.fullName!),
                TextConstant.subTile3(context,
                    text: controller.account.value.email!, color: Colors.grey),
                SizedBoxConst.size(context: context),
                Padding(
                  padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                  child: Column(
                    children: [
                      _dashboard(context),
                      SizedBoxConst.size(context: context, size: 30),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: controller.listNav.length,
                        separatorBuilder: (context, index) =>
                            SizedBoxConst.size(context: context, size: 20),
                        itemBuilder: (context, index) =>
                            _cardFeature(context, controller.listNav[index]),
                      ),
                       SizedBoxConst.size(context: context, size: 20),
                      GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.SIGN_IN);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.logout,color: Colors.grey,),
                              SizedBoxConst.sizeWith(
                                  context: context, size: 20),
                              Expanded(
                                  child: TextConstant.titleH3(context,
                                  color: Colors.grey,
                                      text: 'Đăng xuất',
                                      fontWeight: FontWeight.bold)),
                             SizedBox(),
                              
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  GestureDetector _cardFeature(BuildContext context, NavAccount nav) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(nav.path);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.grey,
          ))),
          padding: EdgeInsets.only(bottom: UtilsReponsive.height(5, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              nav.icon,
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: TextConstant.titleH3(context,
                      text: nav.title, fontWeight: FontWeight.w500)),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorsManager.primary,
              )
            ],
          ),
        ));
  }

  Container _dashboard(BuildContext context) {
    return Container(
      height: UtilsReponsive.height(80, context),
      padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          color: ColorsManager.primary,
          borderRadius:
              BorderRadius.circular(UtilsReponsive.height(15, context))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _colsValue(context, title: 'Sắp tới', content: '10')),
          Container(
            height: double.infinity,
            width: UtilsReponsive.height(2, context),
            color: Colors.white,
          ),
          Expanded(child: _colsValue(context, title: 'Kết thúc', content: '10')),
          Container(
            height: double.infinity,
            width: UtilsReponsive.height(2, context),
            color: Colors.white,
          ),
          Expanded(child: _colsValue(context, title: 'Hồ sơ', content: '10')),
        ],
      ),
    );
  }

  Column _colsValue(BuildContext context,
      {required String title, required String content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextConstant.subTile2(context,
            text: title, fontWeight: FontWeight.bold, color: Colors.white),
        TextConstant.titleH2(context,
            text: content, fontWeight: FontWeight.bold, color: Colors.white)
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
                imageUrl: controller.account.value.avatarUrl ?? '',
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
              onTap: () async{
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
}
