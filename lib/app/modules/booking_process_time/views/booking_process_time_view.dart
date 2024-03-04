import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_process_time_controller.dart';

class BookingProcessTimeView extends BaseView<BookingProcessTimeController> {
  const BookingProcessTimeView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: UtilsReponsive.height(40, context),
                  right: UtilsReponsive.height(10, context),
                  left: UtilsReponsive.height(10, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.all(UtilsReponsive.height(5, context)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: UtilsReponsive.height(2, context)),
                          borderRadius: BorderRadius.circular(
                              UtilsReponsive.height(10, context))),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  TextConstant.titleH2(context,
                      text: 'Chọn thời gian', fontWeight: FontWeight.w700),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            SizedBoxConst.size(context: context),
            Container(
              margin: EdgeInsets.all(UtilsReponsive.height(10, context)),
              decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                      UtilsReponsive.height(20, context))),
              height: UtilsReponsive.height(300, context),
              width: double.infinity,
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  currentDate: DateTime.now(),
                  // firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                  calendarType: CalendarDatePicker2Type.single,
                  centerAlignModePicker: true,
                  selectedDayTextStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  selectedDayHighlightColor: ColorsManager.primary,
                ),
                onValueChanged: (value) async {
                  // await controller.choicePickTime(value.first!);
                  Get.back();
                  // controller.getTimeRange(value);
                },
                value: [DateTime.now()],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Chọn thời gian',
                        // style: TextStyleConstant.black16RobotoBold,
                      )),
                  Wrap(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.only(left: 10),
                        color: ColorsManager.primary,
                      ),
                      Text("Đang chọn"),
                      Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.only(left: 10),
                        color: Colors.red,
                      ),
                      Text("Bận"),
                      Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.only(left: 10),
                          color: Colors.grey.withOpacity(0.3)),
                      Text("Trống"),
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                // height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: (1 / .4),
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(10, (index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            "12:00",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
