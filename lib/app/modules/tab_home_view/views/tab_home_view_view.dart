import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tab_home_view_controller.dart';

class TabHomeView extends BaseView<TabHomeViewController> {
  const TabHomeView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: UtilsReponsive.height(20, context)),
                width: double.infinity,
                height: UtilsReponsive.height(120, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        ImageAssets.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConstant.subTile3(
                            context,
                            text: 'Xin chào, ',
                          ),
                          TextConstant.subTile3(
                            context,
                            text:
                                '${BaseCommon.instance.accountSession?.fullName}',
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              ),
              SizedBoxConst.size(context: context),
              Obx(
                () => controller.isFetch2.value
                    ? const CupertinoActivityIndicator()
                    : controller.listBookingPreview.value.isEmpty
                        ? SizedBox(
                            height: UtilsReponsive.height(100, context),
                            width: double.infinity,
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.imgaeList.length,
                              onPageChanged: (int page) {
                                controller.currentPage.value = page;
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    controller.imgaeList[index],
                                    fit: BoxFit.cover,
                                    width: UtilsReponsive.height(120, context),
                                    height: UtilsReponsive.height(80, context),
                                  ),
                                );
                              },
                            ),
                          )
                        : _appointmentComingWidget(context),
              ),
              SizedBoxConst.size(context: context),
              TextConstant.subTile1(
                context,
                text: 'Hôm nay bạn thế nào?',
              ),
              Container(
                margin: EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                width: UtilsReponsive.height(120, context),
                height: UtilsReponsive.height(2, context),
                color: ColorsManager.primary,
              ),
              _gridIcons(context),
              SizedBoxConst.size(context: context, size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConstant.subTile1(
                    context,
                    text: 'Các bác sĩ ưu tú',
                  ),
                  Obx(() => controller.isLoading.value
                      ? CupertinoActivityIndicator()
                      : SizedBox())
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: UtilsReponsive.height(5, context)),
                width: UtilsReponsive.height(120, context),
                height: UtilsReponsive.height(2, context),
                color: ColorsManager.primary,
              ),
              Obx(() => ListView.separated(
                    itemCount: controller.listDoctorPreview.value.length > 5?5:controller.listDoctorPreview.value.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.opTapCardDoctor(
                            idDoctor: controller.listDoctorPreview[index].id);
                      },
                      child: _cardDoctor(context,
                          doctor: controller.listDoctorPreview[index]),
                    ),
                  )),
              SizedBoxConst.size(context: context)
            ],
          ),
        ));
  }

  Column _appointmentComingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextConstant.subTile1(
              context,
              text: 'Lịch khám sắp tới',
            ),
            Obx(() => controller.isFetch2.value
                ? const CupertinoActivityIndicator()
                : const SizedBox())
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: UtilsReponsive.height(5, context)),
          width: UtilsReponsive.height(120, context),
          height: UtilsReponsive.height(2, context),
          color: ColorsManager.primary,
        ),
        SizedBoxConst.size(context: context),
        SizedBox(
            width: double.infinity,
            height: UtilsReponsive.height(150, context),
            child: Obx(
              () => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.listBookingPreview.value.length,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.BOOKING_DETAIL);
                        },
                        child: _cardNewestBooking(context,
                            booking: controller.listBookingPreview[index]),
                      )),
            )),
      ],
    );
  }

  Container _cardNewestBooking(BuildContext context,
      {required AppointmentPreview booking}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(UtilsReponsive.height(10, context)),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: UtilsReponsive.width(250, context),
      height: UtilsReponsive.height(80, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: ColorsManager.primary,
              ),
              SizedBoxConst.sizeWith(context: context, size: 5),
              TextConstant.subTile3(context,
                  text: FormatDataCustom.convertDatetoFullDate(
                      date: booking.clinicName ?? '')),
            ],
          ),
          SizedBoxConst.size(context: context),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: ColorsManager.primary,
              ),
              SizedBoxConst.sizeWith(context: context, size: 5),
              TextConstant.subTile3(context, text: '${booking.clinicName}')
            ],
          ),
          SizedBoxConst.size(context: context),
          Row(
            children: [
              Icon(
                Icons.person,
                color: ColorsManager.primary,
              ),
              SizedBoxConst.sizeWith(context: context, size: 5),
              TextConstant.subTile3(context, text: '${booking.clinicName}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardDoctor(BuildContext context, {required Doctor doctor}) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
              child: Container(
            padding: EdgeInsets.all(10),
            // color: Colors.red,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: UtilsReponsive.height(120, context),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorsManager.primary,
                                shape: BoxShape.circle),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: doctor.avatarUrl,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset(ImageAssets.logo),
                            ),
                          ),
                          SizedBoxConst.sizeWith(context: context, size: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextConstant.subTile1(context,
                                    text: doctor.fullname),
                                TextConstant.subTile2(context,
                                    text: doctor.medicalSpecialtyName,
                                    size: 12,
                                    color: Colors.grey.withOpacity(0.8)),
                                TextConstant.subTile2(context,
                                    text: doctor.email,
                                    size: 12,
                                    color: Colors.grey.withOpacity(0.8)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBoxConst.sizeWith(context: context),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(
                            vertical: UtilsReponsive.height(2, context),
                            horizontal: UtilsReponsive.height(20, context)),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Chi tiết',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize:
                                  UtilsReponsive.formatFontSize(12, context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () async {
                        controller.opTapCardDoctor(idDoctor: doctor.id);
                      },
                    ),
                  ],
                ),
                SizedBoxConst.size(context: context, size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.titleSmall,
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Kinh nghiệm',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: const Color(0xff979797),
                                    fontSize: 12),
                          ),
                          TextSpan(
                            text: '   ${doctor.rating} năm',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 10),
                          ),
                        ])),
                    Row(
                      children: [
                        Text('Đánh giá  ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: const Color(0xff979797),
                                    fontSize: 12)),
                        RatingBar.builder(
                            unratedColor: const Color(0xff979797),
                            itemSize: 12,
                            initialRating: doctor.rating,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                            onRatingUpdate: (rating) {}),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '(${doctor.rating})',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 10, color: const Color(0xff979797)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ))),
    );
  }

  GridView _gridIcons(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: UtilsReponsive.width(1, context)),
      itemCount: controller.listButton.length,
      // itemCount: controller.listModuleRole.value.length, //
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(controller.listButton[index].path);
          },
          child: Column(
            children: [
              Container(
                  height: UtilsReponsive.height(40, context),
                  width: UtilsReponsive.height(40, context),
                  decoration: BoxDecoration(
                      color: controller.listButton[index].colorBackground,
                      shape: BoxShape.circle),
                  child: controller.listButton[index].icon),
              TextConstant.subTile3(context,
                  text: controller.listButton[index].title)
            ],
          ),
        );
      },
    );
  }
}
