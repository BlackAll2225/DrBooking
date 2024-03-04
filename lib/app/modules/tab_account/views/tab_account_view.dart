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

class TabAccountView extends BaseView<TabAccountController> {
  const TabAccountView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Container(
        height: double.infinity,
        color: ColorsManager.primary.withOpacity(0.3),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBoxConst.size(context: context, size: 20),
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      ImageAssets.logo,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    TextConstant.titleH2(
                      context,
                      text: 'Nguyen Van A',
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              ),
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
              _logoutButton(context),
              SizedBoxConst.size(context: context, size: 50),

            ],
          ),
        ));
  }

  GestureDetector _cardFeature(BuildContext context, NavAccount nav) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(nav.path);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: UtilsReponsive.height(20, context),
            vertical: UtilsReponsive.width(20, context)),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: nav.backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            nav.icon,
            Text(
              nav.title,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: UtilsReponsive.formatFontSize(16, context),
                  fontWeight: FontWeight.w700),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white)
          ],
        ),
      ),
    );
  }

  GestureDetector _logoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.LOGIN);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: UtilsReponsive.height(20, context),
            vertical: UtilsReponsive.width(20, context)),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.logout),
            Text(
              'Đăng xuất',
              style: GoogleFonts.montserrat(
                  color: Colors.red,
                  fontSize: UtilsReponsive.formatFontSize(16, context),
                  fontWeight: FontWeight.w700),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white)

          ],
        ),
      ),
    );
  }
}
