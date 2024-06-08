import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_process_patient_controller.dart';

class BookingProcessPatientView
    extends BaseView<BookingProcessPatientController> {
  const BookingProcessPatientView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppBarCustom(callback: () => Get.back(), title: "Chọn hồ sơ"),
          Expanded(
              child: Obx(() => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.primary,
                      ),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(20, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConstant.subTile2(context,
                              text: '* Ấn để chọn bệnh nhân',
                              color: ColorsManager.primary),
                          SizedBoxConst.size(context: context),
                          Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        UtilsReponsive.height(10, context),
                                    vertical:
                                        UtilsReponsive.height(20, context)),
                                itemCount: controller.listPatients.value.length,
                                separatorBuilder: (context, index) =>
                                    SizedBoxConst.size(context: context),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          controller.onTapProfileCard(
                                              patient: controller
                                                  .listPatients[index]);
                                        },
                                        child: _cardProfile(context,
                                            profile: controller
                                                .listPatients[index]))),
                          ),
                        ],
                      ),
                    )))
        ],
      ),
    ));
  }

  Container _cardProfile(BuildContext context,
      {required PatientPreview profile}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(UtilsReponsive.height(5, context)),
      ),
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
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: profile.avatarUrl ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.white,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageAssets.logo),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConstant.subTile1(context,
                  text: profile.fullname!, fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: UtilCommon.convertDateTime(profile.dateOfBirth!),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }
}
