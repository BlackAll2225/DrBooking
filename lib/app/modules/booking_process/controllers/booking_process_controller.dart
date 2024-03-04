import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingProcessController extends BaseController {
  //TODO: Implement BookingProcessController
  BookingProcessController({required this.isSpecialChoice});
  final bool isSpecialChoice;
  final selectedBranch = 'Chi nhánh Lê Văn Việt'.obs;
  List<String> options = [
    'Chi nhánh Lê Văn Việt',
    'Chi nhánh Võ Văn Ngân',
    'Chi nhánh Lê Thị Riêng',
  ];

  final selectSpecial = 'Vui lòng chọn chuyên khoa'.obs;
  List<String> optionsSpecials = [
    'Chuyên Khoa Mật',
    'Khoa Tim Mạch',
    'Khoa Gan',
  ];

  final selectDoctor = 'Mặc định'.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showBottomBranch() async {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
            topRight: Radius.circular(UtilsReponsive.height(10, Get.context!)),
          )),
      padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
      constraints:
          BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
      child: Column(
        children: [
          TextConstant.subTile1(Get.context!, text: 'Chi nhánh'),
          Expanded(
              child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                selectedBranch.value = options[index];
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile2(context, text: options[index]),
                      options[index] == selectedBranch.value
                          ? Icon(Icons.check)
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }

  showBottomSpecial() async {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilsReponsive.height(10, Get.context!)),
            topRight: Radius.circular(UtilsReponsive.height(10, Get.context!)),
          )),
      padding: EdgeInsets.all(UtilsReponsive.height(20, Get.context!)),
      constraints:
          BoxConstraints(maxHeight: UtilsReponsive.height(400, Get.context!)),
      child: Column(
        children: [
          TextConstant.subTile1(Get.context!, text: 'Chuyên khoa'),
          Expanded(
              child: ListView.builder(
            itemCount: optionsSpecials.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                selectSpecial.value = optionsSpecials[index];
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile2(context,
                          text: optionsSpecials[index]),
                      optionsSpecials[index] == selectSpecial.value
                          ? Icon(Icons.check)
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }

}
