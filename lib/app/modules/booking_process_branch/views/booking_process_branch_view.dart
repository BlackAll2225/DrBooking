import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_process_branch_controller.dart';

class BookingProcessBranchView
    extends BaseView<BookingProcessBranchController> {
  const BookingProcessBranchView({Key? key}) : super(key: key);
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
            child: ListView.separated(
                padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                itemBuilder: (context, index) =>GestureDetector(onTap:(){
                  Get.toNamed(Routes.BOOKING_PROCESS_SERVICE);
                },child: _cardBranch(context)),
                separatorBuilder: (context, index) =>
                    SizedBoxConst.size(context: context),
                itemCount: 4))
      ],
    )));
  }

  _cardBranch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(UtilsReponsive.height(5, context)),
      ),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.width(150, context),
      child: Row(
        children: [
          Container(
            height: UtilsReponsive.width(100, context),
            decoration: BoxDecoration(
              // color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(5, context)),
            ),
            child: Image.asset(ImageAssets.logo),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: UtilsReponsive.height(10, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Lê Văn Việt',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: ' (cách 14 km)',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorsManager.primary,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
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
                        text:
                            '123 Lê Văn Việt, Phường Hiệp Phú, Quận 9, TP.HCM',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
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
                        text: '0393 1828 090',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
                SizedBoxConst.size(context: context),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'Giờ làm việc: ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xff979797),
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                      TextSpan(
                        text: '08:00 - 22:00',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: UtilsReponsive.height(14, context)),
                      ),
                    ])),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
