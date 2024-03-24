import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/modules/booking_process/controllers/booking_process_controller.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/doctor_controller.dart';

class DoctorView extends BaseView<BookingProcessController> {
  const DoctorView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarCustom(
              callback: () {
                Get.back();
              },
              title: "Danh sách bác sĩ"),
          SizedBoxConst.size(context: context),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: UtilsReponsive.height(20, context)),
            child: Row(
              children: [
                TextConstant.subTile1(context, text: "Mặc định"),
                SizedBoxConst.sizeWith(context: context),
                Obx(()=>
                  InkWell(
                    onTap: () {
                      controller.selectedDoctor.value = Doctor.emptyFactory();
                      Get.back();
                    },
                    child: Icon(
                      controller.selectedDoctor.value.id.isEmpty?Icons.radio_button_checked:Icons.radio_button_off,
                      color: ColorsManager.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: UtilsReponsive.height(20, context)),
            child: TextConstant.subTile3(context,
                text:
                    "(Hệ thống tự chọn cho bạn hoặc bạn có thể chọn vào bác sĩ muốn đặt)",
                    fontWeight: FontWeight.w500,
                color: ColorsManager.primary),
          ),
          SizedBoxConst.size(context: context),
          Expanded(
              child: Obx(() => ListView.separated(
                    // padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                    itemCount: controller.listDoctors.value.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () async{
                        controller.onTapCardDoctor(controller.listDoctors[index]);
                        Get.back();
                      },
                      child: _cardDoctor(context,
                          doctor: controller.listDoctors[index]),
                    ),
                  )))
        ],
      )),
    );
  }

  Container _cardDoctor(BuildContext context, {required Doctor doctor}) {
    return Container(
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
                            color: ColorsManager.primary, shape: BoxShape.circle),
                        child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl: doctor.avatarUrl,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(color: Colors.white,),
                                            errorWidget: (context, url, error) =>
                                                Image.asset(ImageAssets.logo),
                                          ),),
                    SizedBoxConst.sizeWith(context: context, size: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextConstant.subTile1(context, text: doctor.fullname),
                          TextConstant.subTile2(context,
                              text: doctor.medicalSpecialtyName,
                              size: 12,
                              color: Colors.grey.withOpacity(0.8)),
                              // TextConstant.subTile2(context,
                              // text: doctor.email,
                              // size: 12,
                              // color: Colors.grey.withOpacity(0.8)),
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
                        fontSize: UtilsReponsive.formatFontSize(12, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  Get.toNamed(Routes.DOCTOR_DETAIL, parameters: {
                    "idDoctor":doctor.id
                  });
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff979797), fontSize: 12),
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff979797), fontSize: 12)),
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
}
