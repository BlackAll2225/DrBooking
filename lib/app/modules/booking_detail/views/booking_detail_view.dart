import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailView extends BaseView<BookingDetailController> {
  const BookingDetailView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppBarCustom(
            callback: () {
              Get.back();
            },
            title: 'Thông tin chi tiết',
            traling: IconButton(
                onPressed: () {
                  Get.dialog(Center(
                    child: Container(
                      color: Colors.white,
                      child: QrImageView(
                        data: controller.appointment.value.idAppointment
                            .toString(),
                        version: QrVersions.auto,
                        size: UtilsReponsive.height(300, context),
                        gapless: false,
                      ),
                    ),
                  ));
                },
                icon: Icon(
                  LineIcons.qrcode,
                  color: Colors.black,
                  size: UtilsReponsive.height(30, context),
                )),
          ),
          Obx(
            () => controller.isLoading.value
                ? Center(
                    child: CupertinoActivityIndicator(),
                  )
                : Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(20, context)),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextConstant.subTile1(context,
                                            text: controller.dateSlot.value,
                                            fontWeight: FontWeight.bold),
                                        TextConstant.subTile2(context,
                                            text: 'Khám mới',
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                        SizedBoxConst.size(context: context),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: UtilsReponsive.height(
                                                  10, context),
                                              vertical: UtilsReponsive.height(
                                                  5, context)),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.green.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      UtilsReponsive.height(
                                                          8, context))),
                                          child: TextConstant.subTile2(context,
                                              text: listStatus[controller
                                                  .appointment
                                                  .value
                                                  .appointmentStatus!],
                                              color: Colors.green.shade600),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: UtilsReponsive.height(
                                              30, context),
                                          vertical: UtilsReponsive.height(
                                              30, context)),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.primary
                                            .withOpacity(0.3),
                                      ),
                                      child: TextConstant.titleH1(context,
                                          text: controller
                                              .appointment.value.numericalOrder
                                              .toString(),
                                          color: ColorsManager.primary),
                                    ),
                                  ],
                                ),
                                SizedBoxConst.size(context: context),
                                Divider(
                                  color: Colors.grey,
                                  height: UtilsReponsive.height(5, context),
                                ),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Thời gian',
                                    content: listTime[controller
                                            .appointment.value.slotNumber! -
                                        1]),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Đối tượng',
                                    content: 'Không ưu tiên'),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Chi nhánh',
                                    content: controller
                                        .appointment.value.clinicName
                                        .toString()),
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
                                    content: 'Khám theo yêu cầu'),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Chuyên khoa',
                                    content: controller
                                        .appointment.value.medicalSpecialtyName
                                        .toString()),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Loại hình', content: 'BHYT'),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Bác sĩ',
                                    content: controller
                                        .appointment.value.doctorName
                                        .toString()),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Số phòng',
                                    content: controller
                                        .appointment.value.roomName
                                        .toString()),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Triệu chứng', content: ''),
                                SizedBoxConst.size(context: context),
                                TextConstant.subTile3(context,
                                    text: controller.appointment.value.symptom
                                        .toString(),
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
                                SizedBox(
                                  height: UtilsReponsive.height(50, context),
                                  child: SfBarcodeGenerator(
                                    value: controller
                                        .appointment.value.patientCode
                                        .toString(),
                                  ),
                                ),
                                SizedBoxConst.size(context: context),
                                TextConstant.subTile2(context,
                                    text: 'Mã bệnh nhân',
                                    color: Colors.black87),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Bệnh nhân',
                                    content: controller
                                        .appointment.value.patientName
                                        .toString()),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Giới tính',
                                    content: listGender[controller.appointment
                                            .value.biologicalGender!].name
                                        ),
                                SizedBoxConst.size(context: context),
                                _textData(context,
                                    title: 'Năm sinh',
                                    content: controller
                                        .appointment.value.dateOfBirth!.year
                                        .toString()),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                controller.appointment.value.appointmentStatus == 0?
                                _buttonCheckin(context):const SizedBox.shrink(),
                                controller.appointment.value.appointmentStatus == 0?
                                _buttonCancel(context):const SizedBox.shrink(),
                                 controller.appointment.value.appointmentStatus == 2 && !controller.appointment.value.isReviewed!?
                                _buttonReview(context):const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    ));
  }

  Container _buttonReview(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.red, width: UtilsReponsive.height(2, context)),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(2, context),
              horizontal: UtilsReponsive.height(20, context)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Đánh giá',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.red,
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          //  await controller.cancelRequest();
          await _bottomRating(context);
        },
      ),
    );
  }

  Container _buttonCancel(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.red, width: UtilsReponsive.height(2, context)),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(2, context),
              horizontal: UtilsReponsive.height(20, context)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Huỷ đăng kí',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.red,
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          await controller.cancelRequest();
          // await _bottomRating(context);
        },
      ),
    );
  }

  Container _buttonCheckin(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: UtilsReponsive.height(10, context)),
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
            'Tôi đã tới',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: UtilsReponsive.formatFontSize(12, context),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async {
          await controller.checkIn();
        },
      ),
    );
  }

  Row _textData(BuildContext context,
      {required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextConstant.subTile2(context, text: title, color: Colors.black87),
        TextConstant.subTile2(context,
            text: content, fontWeight: FontWeight.bold),
      ],
    );
  }

  _bottomRating(BuildContext context) {
    double rating = 4;
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UtilsReponsive.height(15, context)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: TextConstant.titleH3(context, text: 'Đánh giá')),
            SizedBox(height: UtilsReponsive.height(10, context)),
            Center(
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  rating = value;
                },
              ),
            ),
            SizedBoxConst.size(context: context),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller
                            .reasonChoice(controller.templateReason[index]);
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Icon(controller.reasonChoice !=
                                    controller.templateReason[index]
                                ? Icons.radio_button_off_outlined
                                : Icons.radio_button_checked),
                          ),
                          SizedBox(width: UtilsReponsive.height(10, context)),
                          TextConstant.subTile2(context,
                              text: controller.templateReason[index])
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: UtilsReponsive.height(10, context),
                    ),
                itemCount: controller.templateReason.length),
            SizedBox(height: UtilsReponsive.height(10, context)),
            Obx(() => Visibility(
                  visible: controller.reasonChoice == 'Khác',
                  child: FormFieldWidget(
                      padding: UtilsReponsive.width(10, context),
                      controllerEditting: controller.textEdittingController,
                      radiusBorder: UtilsReponsive.height(15, context),
                      fillColor: Colors.grey.withOpacity(0.3),
                      setValueFunc: (value) {}),
                )),
            GestureDetector(
              onTap: () async {
                // await controller.submitReview(
                //     rating, item.id!);
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: UtilsReponsive.height(10, context),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: UtilsReponsive.height(10, context),
                    horizontal: UtilsReponsive.height(15, context)),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(10, context))
                    // shape: BoxShape.circle,
                    ),
                child: Text('Xác nhận',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: UtilsReponsive.formatFontSize(13, context),
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
