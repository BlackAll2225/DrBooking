import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/model/branch.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_process_clinic_controller.dart';

class BookingProcessClinicView
    extends BaseView<BookingProcessClinicController> {
  const BookingProcessClinicView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        AppBarCustom(
            callback: () {
              Get.back();
            },
            title: "Chọn chi nhánh"),
        Expanded(
            child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primary,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConstant.subTile2(context,
                          text: '* Ấn để chọn chi nhánh',
                          color: ColorsManager.primary),
                          SizedBoxConst.size(context: context),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  controller.onTapClinicCard(
                                      clinic: controller.listClinic[index]);
                                  // Get.toNamed(Routes.BOOKING_PROCESS_SERVICE, arguments: controller.requestParamBooking);
                                },
                                child: _cardBranch(context,
                                    clinic: controller.listClinic[index])),
                            separatorBuilder: (context, index) =>
                                SizedBoxConst.size(context: context),
                            itemCount: controller.listClinic.value.length),
                      ),
                    ],
                  ),
                ),
        ))
      ],
    )));
  }

  _cardBranch(BuildContext context, {required Clinic clinic}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context)),
      ),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: double.infinity,
      // height: UtilsReponsive.width(150, context),
      child: Column(
        children: [
          TextConstant.titleH3(context, text: clinic.name),
          SizedBoxConst.size(context: context),
          Container(
            height: UtilsReponsive.width(120, context),
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(5, context)),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: clinic.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.white,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageAssets.logo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: UtilsReponsive.height(10, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Địa chỉ: ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: clinic.fullAddress,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      // TextSpan(
                      //   text: ' (cách 14 km)',
                      //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //       color: ColorsManager.primary,
                      //       fontSize: UtilsReponsive.height(14, context)),
                      // ),
                    ])),
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Số điện thoại: ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: clinic.phoneNumber,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
                SizedBoxConst.size(context: context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
