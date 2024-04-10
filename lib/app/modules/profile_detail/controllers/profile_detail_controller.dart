import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/profile_remote.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/modules/new_profile/controllers/new_profile_controller.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailController extends BaseController {
  ProfileDetailController({required this.idPatient});
  final String idPatient;
  TextEditingController nameTextController = TextEditingController(text: '');
  TextEditingController birthTextController = TextEditingController(text: '');
  TextEditingController genderTextController = TextEditingController(text: '');
  TextEditingController addressTextController = TextEditingController(text: '');
  TextEditingController bhtyTextController = TextEditingController(text: '');
  TextEditingController bhytExpTextController = TextEditingController(text: '');
  TextEditingController bhtyAddressTextController =
      TextEditingController(text: '');
  TextEditingController cccdTextController = TextEditingController(text: '');
  TextEditingController cccdDateTextController =
      TextEditingController(text: '');
  TextEditingController cccdAddressTextController =
      TextEditingController(text: '');

  Rx<DateTime> dateCurrent = DateTime.now().obs;
  Rx<DateTime> dateBHYTExp = DateTime.now().obs;
  Rx<DateTime> dateCCCDDate = DateTime.now().obs;

  ProfileApi profileApi = ProfileRemote();

  final isLockUpdate = true.obs;

  @override
  Future<void> onInit() async {
    log(idPatient);
    await initData();
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

  onTapBirth(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày sinh',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: dateCurrent.value,
              lastDate: DateTime.now().add(Duration(days: 30)),
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              birthTextController.text = UtilCommon.convertDateTime(value[0]!);
              dateCurrent.value = value[0]!;
              Get.back();
            },
            value: [dateCurrent.value],
          ),
        ));
  }

  onTapGender() async {
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
          Expanded(
              child: ListView.builder(
            itemCount: listGender.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                genderTextController.text = listGender[index].name;
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile2(context, text: listGender[index].name),
                      listGender[index].name == genderTextController.text
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

  onTapBHYTExpDate(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày hết hạn',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: dateBHYTExp.value,
              lastDate: DateTime.now().add(Duration(days: 30)),
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              bhytExpTextController.text =
                  UtilCommon.convertDateTime(value[0]!);
              dateBHYTExp.value = value[0]!;
              Get.back();
            },
            value: [dateBHYTExp.value],
          ),
        ));
  }

  onTapCCCDDate(BuildContext context) async {
    await Get.defaultDialog(
        title: 'Ngày cấp',
        content: SizedBox(
          height: UtilsReponsive.height(300, context),
          width: UtilsReponsive.height(300, context),
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: dateCCCDDate.value,
              lastDate: DateTime.now().add(Duration(days: 30)),
              calendarType: CalendarDatePicker2Type.single,
              centerAlignModePicker: true,
              selectedDayTextStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: ColorsManager.primary,
            ),
            onValueChanged: (value) async {
              cccdDateTextController.text =
                  UtilCommon.convertDateTime(value[0]!);
              dateCCCDDate.value = value[0]!;
              Get.back();
            },
            value: [dateCCCDDate.value],
          ),
        ));
  }

  updateProfile() async {
    String fullName = nameTextController.text;
    String birthDate = birthTextController.text;
    String gender = genderTextController.text;
    String address = addressTextController.text;
    String bhyt = bhtyTextController.text;
    String bhytExp = bhytExpTextController.text;
    String bhytAddress = bhtyAddressTextController.text;
    String cccd = cccdTextController.text;
    String cccdDate = cccdDateTextController.text;
    String cccdAddress = cccdAddressTextController.text;
    await profileApi.updateProfile(idPatient: 'idPatient').then((value) {
      nameTextController.text;
      birthTextController.text;
      genderTextController.text;
      addressTextController.text;
      bhtyTextController.text;
      bhytExpTextController.text;
      bhtyAddressTextController.text;
      cccdTextController.text;
      cccdDateTextController.text;
      cccdAddressTextController.text;
    }).catchError((error) {
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  initData() async {
    isLoading(true);
    await profileApi.getProfileDetailById(idPatient: idPatient).then((value) {
      nameTextController.text = value.fullname ?? '';
      birthTextController.text = UtilCommon.convertDateTime(value.dateOfBirth!);
      genderTextController.text = value.biologicalGender == 0 ? 'Nữ' : 'Nam';
      addressTextController.text = value.addressId ?? '';
      bhtyTextController.text = value.healthInsuranceCode ?? '';
      bhytExpTextController.text = value.idIssuedDate != null
          ? UtilCommon.convertDateTime(value.idIssuedDate!)
          : '';
      bhtyAddressTextController.text = value.hiIssuedPlace ?? '';
      cccdTextController.text = value.idCode ?? '';
      cccdDateTextController.text = value.expiredDate != null
          ? UtilCommon.convertDateTime(value.expiredDate!)
          : '';
      cccdAddressTextController.text = value.addressId ?? '';
    }).catchError((error) {
      isLoading(false);

      log(error.toString());
      UtilCommon.snackBar(text: '${error.message}');
    });
    isLoading(false);
  }

  onTapEdit() {
    isLockUpdate(false);
  }
  onTapCancel() {
    isLockUpdate(true);
  }
   onTapUpdate() async{
    isLockUpdate(true);
  }
}
