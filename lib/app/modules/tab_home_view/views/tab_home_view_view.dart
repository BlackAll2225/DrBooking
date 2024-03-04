import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/modules/doctor_detail/views/doctor_detail_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào, ',
                          ),
                          Text(
                            'Nguyen Van A, ',
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              ),
              SizedBoxConst.size(context: context),
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
                          child: _cardNewestBooking(
                              context,
                              booking: controller.listBookingPreview[index]),
                        )),
                  )),
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
                    itemCount: controller.listDoctorPreview.value.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DOCTOR_DETAIL);
                      },
                      child: _cardDoctor(context,
                          doctor: controller.listDoctorPreview[index]),
                    ),
                  ))
            ],
          ),
        ));
  }

  Container _cardNewestBooking(BuildContext context,
      {required BookingPreview booking}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
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
                      date: booking.date)),
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
              TextConstant.subTile3(context, text: '${booking.time}')
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
              TextConstant.subTile3(context, text: '${booking.name}'),
            ],
          ),
        ],
      ),
    );
  }

  Container _cardDoctor(BuildContext context, {required DoctorPreview doctor}) {
    return Container(
      // color: Colors.red,
      height: UtilsReponsive.height(100, context),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: ColorsManager.primary, shape: BoxShape.circle),
                      child: Image.asset(ImageAssets.logo)),
                  SizedBoxConst.sizeWith(context: context, size: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextConstant.subTile1(context, text: doctor.name),
                      TextConstant.subTile2(context,
                          text: doctor.special,
                          size: 12,
                          color: Colors.grey.withOpacity(0.8)),
                          TextConstant.subTile2(context,
                          text: doctor.branch,
                          size: 12,
                          color: Colors.grey.withOpacity(0.8)),
                    ],
                  )
                ],
              ),
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
                        fontSize: UtilsReponsive.formatFontSize(12, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {},
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff979797), fontSize: 12),
                    ),
                    TextSpan(
                      text: '   ${doctor.exp} năm',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 10),
                    ),
                  ])),
              Row(
                children: [
                  Text('Đánh giá  ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff979797), fontSize: 12)),
                  RatingBar.builder(
                      unratedColor: const Color(0xff979797),
                      itemSize: 12,
                      initialRating: doctor.rate,
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
                    '(${doctor.countReview})',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 10, color: const Color(0xff979797)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
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
                      color: controller.listButton[index].colorBackground, shape: BoxShape.circle),
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
