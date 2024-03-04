import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tab_profile_controller.dart';

class TabProfileView extends BaseView<TabProfileController> {
  const TabProfileView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: UtilsReponsive.height(30, context)),
        child: Column(
          children: [
            Center(
              child: TextConstant.titleH3(context, text: 'Quản lý hồ sơ'),
            ),
            ListView.separated(
                shrinkWrap: true,
                padding:
                    EdgeInsets.only(top: UtilsReponsive.height(10, context)),
                itemCount: 3,
                separatorBuilder: (context, index) =>
                    SizedBoxConst.size(context: context),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_DETAIL);
                    }, child: _cardProfile(context))),
            SizedBoxConst.size(context: context, size: 20),
            Container(
              margin:
                  EdgeInsets.only(bottom: UtilsReponsive.height(10, context)),
              width: double.infinity,
              height: UtilsReponsive.height(50, context),
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
                    'Thêm hồ sơ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: UtilsReponsive.formatFontSize(12, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  Get.toNamed(Routes.NEW_PROFILE);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _cardProfile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(UtilsReponsive.height(5, context)),
      ),
      // margin: EdgeInsets.symmetric(
      //   horizontal: UtilsReponsive.height(10, context),
      // ),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.width(100, context),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorsManager.primary.withOpacity(0.5),
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            margin: EdgeInsets.symmetric(
              horizontal: UtilsReponsive.height(10, context),
            ),
            width: UtilsReponsive.width(70, context),
            height: UtilsReponsive.width(70, context),
            child: Image.asset(
              ImageAssets.logo,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConstant.subTile1(context,
                  text: 'Nguyễn Văn A', fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: '12/12/1999',
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }
}
