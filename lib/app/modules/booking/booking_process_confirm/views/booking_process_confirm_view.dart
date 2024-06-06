import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/utils/format_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_process_confirm_controller.dart';

class BookingProcessConfirmView
    extends BaseView<BookingProcessConfirmController> {
  const BookingProcessConfirmView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    Get.find<BookingProcessConfirmController>().count;
    return Scaffold(
        bottomNavigationBar: Container(
          height: UtilsReponsive.height(70, context),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: UtilsReponsive.height(10, context)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.primary),
            padding: EdgeInsets.symmetric(
                horizontal: UtilsReponsive.height(10, context)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     TextConstant.subTile2(context,
                          text: 'Chi phí đặt lịch: ', color: Colors.white),
                      TextConstant.titleH2(
                        context,
                        text: '50.000 VND ',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                   await controller.getLinkPayment();
                    // Get.offAllNamed(Routes.HOME);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: UtilsReponsive.height(15, context)),
                    padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: Text(
                      'Tiến thành thanh toán',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: ColorsManager.primary,
                          fontSize: UtilsReponsive.formatFontSize(12, context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppBarCustom(
                  callback: () {
                    Get.back();
                  },
                  title: 'Xác nhận'),
              Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              UtilsReponsive.height(20, context)),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  width: UtilsReponsive.height(1, context)),
                              borderRadius: BorderRadius.circular(
                                  UtilsReponsive.height(20, context))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConstant.subTile1(context,
                                  text: FormatDataCustom.convertDatetoFullDate(date: controller.requestParam.dutySchedule!.startTime!.toString()),
                                  fontWeight: FontWeight.bold),
                              TextConstant.subTile2(context,
                                  text: 'Khám mới',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700),
                              SizedBoxConst.size(context: context),
                              Divider(
                                color: Colors.grey,
                                height: UtilsReponsive.height(5, context),
                              ),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Thời gian', content: listTime[controller.requestParam.dutySchedule!.slotNumber-1]),
                              SizedBoxConst.size(context: context),
                              // _textData(context,
                              //     title: 'Đối tượng', content: 'Không ưu tiên'),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Chi nhánh',
                                  content: controller.requestParam.clinic!.name),
                              SizedBoxConst.size(context: context),
                              Divider(
                                color: Colors.grey,
                                height: UtilsReponsive.height(5, context),
                              ),
                              SizedBoxConst.size(context: context),
                              TextConstant.subTile1(context,
                                  text: 'Chi tiết lịch khám',
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManager.primary),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Dịch vụ',
                                  content: controller.requestParam.dataButton!.appointmentType!.label),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Chuyên khoa', content: controller.requestParam.specialty?.name??''),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Bác sĩ', content: controller.requestParam.doctor?.fullname??'Mặc định'),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Triệu chứng', content: ''),
                              SizedBoxConst.size(context: context),
                              TextConstant.subTile3(context,
                                  text:
                                      '${controller.requestParam.symptom}',
                                  color: Colors.black54),
                              SizedBoxConst.size(context: context),
                              Divider(
                                color: Colors.grey,
                                height: UtilsReponsive.height(5, context),
                              ),
                              SizedBoxConst.size(context: context),
                              TextConstant.subTile1(context,
                                  text: 'Thông tin bệnh nhân',
                                  fontWeight: FontWeight.bold,
                                  color: ColorsManager.primary),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Bệnh nhân', content: controller.requestParam.patient!.fullname!),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Giới tính', content: listGender[controller.requestParam.patient!.biologicalGender!].name),
                              SizedBoxConst.size(context: context),
                              _textData(context,
                                  title: 'Năm sinh', content: controller.requestParam.patient!.dateOfBirth!.year.toString()),
                              SizedBoxConst.size(context: context),
                              Divider(
                                color: Colors.grey,
                                height: UtilsReponsive.height(5, context),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    UtilsReponsive.height(20, context)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextConstant.subTile3(context,
                                        text: 'Lưu ý:',
                                        color: ColorsManager.primary,
                                        fontWeight: FontWeight.bold),
                                    SizedBoxConst.size(
                                        context: context, size: 5),
                                    TextConstant.subTile3(context,
                                        text:
                                            '- Vui lòng đưa phiếu này cho quầy lễ tân',
                                        color: Colors.black87),
                                    SizedBoxConst.size(
                                        context: context, size: 5),
                                    TextConstant.subTile3(context,
                                        text:
                                            '- Vui lòng đến sớm trước giờ khám 15 phút',
                                        color: Colors.black87),
                                    SizedBoxConst.size(
                                        context: context, size: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Row _textData(BuildContext context,
      {required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: TextConstant.subTile2(context, text: title, color: Colors.black87)),
        Expanded(
          child: TextConstant.subTile2(context,
              text: content, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
