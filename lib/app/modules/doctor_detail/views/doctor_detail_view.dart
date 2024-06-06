import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends BaseView<DoctorDetailController> {
  const DoctorDetailView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: UtilsReponsive.height(50, context),
          width: double.infinity,
          // padding: EdgeInsets.symmetric(
          //     horizontal: UtilsReponsive.height(10, context)),
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
                'Đặt lịch ngay',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: UtilsReponsive.formatFontSize(12, context),
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () async {
              Get.offNamed(Routes.BOOKING_PROCESS_PATIENT);
            },
          ),
        ),
        body: Obx(() => _body(context)));
  }

  SafeArea _body(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        AppBarCustom(
            callback: () {
              Get.back();
            },
            title: 'Thông tin bác sĩ'),
        SizedBoxConst.size(context: context),
        Expanded(
            child: SingleChildScrollView(
                child: Stack(
          children: [
            Container(
              height: UtilsReponsive.height(200, context),
              width: double.infinity,
              child: Image.asset(
                ImageAssets.imageWall,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: UtilsReponsive.height(160, context),
              left: UtilsReponsive.height(10, context),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: UtilsReponsive.height(80, context),
                    width: UtilsReponsive.height(80, context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: controller.doctor.value.avatarUrl ?? '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(ImageAssets.logo),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: UtilsReponsive.height(5, context),
                        horizontal: UtilsReponsive.height(20, context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          UtilsReponsive.height(20, context)),
                      color: ColorsManager.primary,
                    ),
                    child: TextConstant.subTile2(context,
                        text: '${controller.doctor.value.fullname}',
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxConst.size(context: context, size: 230),
                  SizedBox(
                    width: double.infinity,
                    child: ExpandableText(
                      "${controller.doctor.value.experience ?? ''}",
                      expandText: 'Xem thêm',
                      collapseText: 'Thu gọn',
                      maxLines: 3,
                      linkColor: ColorsManager.primary,
                    ),
                  ),
                  Obx(() => _tabAboutFeedBack(context)),
                  SizedBoxConst.size(context: context, size: 20),
                  Obx(() => !controller.isFeedback.value
                      ? _tabAbout(context)
                      : _tabFeedback(context))
                ],
              ),
            )
          ],
        )))
      ],
    ));
  }

  _tabFeedback(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Đánh giá',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w800)),
              TextSpan(
                  text: '   ${controller.doctor.value.rating} ⭐️',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w800)),
              // TextSpan(
              //     text: '   (124)',
              //     style: TextStyle(
              //         fontSize: 12,
              //         color: Colors.grey.shade500,
              //         fontWeight: FontWeight.w800)),
            ],
          ),
        ),
        SizedBoxConst.size(context: context),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listFeedback.value.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorsManager.primary,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(top: 10),
                // padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              height: UtilsReponsive.height(50, context),
                              width: UtilsReponsive.height(50, context),
                              padding: EdgeInsets.all(
                                  UtilsReponsive.height(5, context)),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ColorsManager.primary),
                                  shape: BoxShape.circle),
                              child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: UtilsReponsive.height(80, context),
                                  width: UtilsReponsive.height(80, context),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child:
                                      Image.asset('assets/images/user1.png')),
                            ),
                            SizedBoxConst.sizeWith(context: context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              SizedBoxConst.size(context: context),
                                Row(
                                  children: [
                                    Text(
                                        "${controller.listFeedback[index].patientProfileName}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800)),
                                    SizedBoxConst.sizeWith(context: context),
                                    TextConstant.subTile3(context,
                                        text:
                                            '${controller.listFeedback[index].rating}⭐️',
                                        size: 13)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBoxConst.size(context: context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextConstant.subTile3(context,
                              text:
                                  '${controller.listFeedback[index].feedback}',
                              size: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  _tabAbout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConstant.subTile1(context,
            text: 'Công việc', color: ColorsManager.primary),
        SizedBoxConst.size(context: context),
        _overViewBlock(context),
        SizedBoxConst.size(context: context, size: 20),
        TextConstant.subTile1(context,
            text: 'Các hoạt động', color: ColorsManager.primary),
        SizedBoxConst.size(context: context),
        SizedBox(
          height: UtilsReponsive.height(100, context),
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: urlImage.length,
            separatorBuilder: (context, index) =>
                SizedBoxConst.sizeWith(context: context),
            itemBuilder: (context, index) => Container(
              clipBehavior: Clip.antiAlias,
              height: UtilsReponsive.height(80, context),
              width: UtilsReponsive.width(100, context),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(UtilsReponsive.height(10, context)),
                  color: ColorsManager.primary),
              child: Image.asset(
                urlImage[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBoxConst.size(context: context),
      ],
    );
  }

  Widget _overViewBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildOverviewTile(Icons.work, 'Kinh nghiệm',
                  '${controller.doctor.value.yearOfExperience}', context),
            ),
            Expanded(
              child: _buildOverviewTile(Icons.folder_special, 'Chuyên khoa',
                  '${controller.doctor.value.specialtyName}', context),
            ),
          ],
        ),
        SizedBox(
          height: UtilsReponsive.height(10, context),
        ),
        Row(
          children: [
            Expanded(
              child: _buildOverviewTile(Icons.work, 'Chi nhánh',
                  "${controller.doctor.value.clinicName}", context),
            ),
            Expanded(
              child: _buildOverviewTile(
                  Icons.work,
                  'Bằng cấp',
                  '${controller.doctor.value.degree ?? 'Chưa cập nhật'}',
                  context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewTile(
      IconData icon, String title, String value, BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.work,
          color: Colors.grey.shade600,
          size: 20,
        ),
        SizedBox(
          width: UtilsReponsive.width(10, context),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _tabAboutFeedBack(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: UtilsReponsive.width(100, context),
            decoration: controller.isFeedback.value
                ? null
                : BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorsManager.primary, width: 4))),
            alignment: Alignment.center,
            height: UtilsReponsive.height(40, context),
            child: TextButton(
              child: Text(
                'Thông tin',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ColorsManager.primary),
              ),
              onPressed: () {
                controller.updateTabFeedBack(false);
              },
            ),
          ),
          Container(
            width: UtilsReponsive.width(100, context),
            decoration: !controller.isFeedback.value
                ? null
                : BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorsManager.primary, width: 4))),
            alignment: Alignment.center,
            height: UtilsReponsive.height(40, context),
            child: TextButton(
              child: Text(
                'Đánh giá',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ColorsManager.primary),
              ),
              onPressed: () {
                controller.updateTabFeedBack(true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
