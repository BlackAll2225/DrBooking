import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/doctor_controller.dart';

class DoctorView extends BaseView<DoctorController> {
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
                Icon(
                  Icons.radio_button_checked,
                  color: ColorsManager.primary,
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
                    padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                    itemCount: controller.listDoctorPreview.value.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) =>
                        SizedBoxConst.size(context: context),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: _cardDoctor(context,
                          doctor: controller.listDoctorPreview[index]),
                    ),
                  )))
        ],
      )),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  )
                ],
              ),
              Column(
                children: [
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
}
