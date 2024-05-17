import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/data/respository/auth/auth_api.dart';
import 'package:drbooking/app/modules/tab-patient/controllers/tab_patient_controller.dart';
import 'package:drbooking/app/modules/tab-patient/views/tab_patient_view.dart';
import 'package:drbooking/app/modules/tab_account/controllers/tab_account_controller.dart';
import 'package:drbooking/app/modules/tab_account/views/tab_account_view.dart';
import 'package:drbooking/app/modules/tab_account/views/tab_account_view_v2.dart';
import 'package:drbooking/app/modules/tab_calendar/controllers/tab_calendar_controller.dart';
import 'package:drbooking/app/modules/tab_calendar/views/tab_calendar_view.dart';
import 'package:drbooking/app/modules/tab_history/controllers/tab_history_controller.dart';
import 'package:drbooking/app/modules/tab_history/views/tab_history_view.dart';
import 'package:drbooking/app/modules/tab_home_view/controllers/tab_home_view_controller.dart';
import 'package:drbooking/app/modules/tab_home_view/views/tab_home_view_view.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class HomeController extends BaseController {
  //TODO: Implement HomeController
  RxList<Widget> body = RxList([
    TabHomeView(),
    TabCalendarView(),
    SizedBox(),
    TabPatientView(),
    TabAccountViewV2()
  ]);
  final indexSelected = 0.obs;
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

  onTapped(int index) async {
    switch (index) {
      case 0:
        Get.find<TabHomeViewController>();
        indexSelected(0);
        break;
      case 1:
        Get.find<TabCalendarController>().fetchListBooking();
        indexSelected(1);
        break;
      case 2:
        break;
      case 3:
       await Get.find<TabPatientController>().fetchAllPatients();
        indexSelected(3);
        break;
      case 4:
        Get.find<TabAccountController>();
        indexSelected(4);
        break;
      default:
    }
  }
  onTapBooking()async{
  //  if (BaseCommon.instance.accountSession!.isEmailConfirmed == 'False') {
  //     await initPopup();
  //   } else {
      Get.toNamed(Routes.BOOKING_PROCESS_PATIENT);
    // }
  }

  initPopup() async {
      await QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        title: 'Xác thực',
        text:
            'Bạn cần phải xác thực email trước khi đặt lịch',
        barrierDismissible: false,
        confirmBtnText: 'Xác thực ngay',
        confirmBtnTextStyle: TextStyle(
            fontSize: UtilsReponsive.height(14, Get.context!),
            fontWeight: FontWeight.bold,
            color: Colors.white),
        cancelBtnTextStyle: TextStyle(
            fontSize: UtilsReponsive.height(
              14,
              Get.context!,
            ),
            fontWeight: FontWeight.bold),
        cancelBtnText: 'Để sau',
        confirmBtnColor: ColorsManager.primary,
        onConfirmBtnTap: () {
          Get.offNamed(Routes.VERIFY_OTP, arguments: false);
        },
      );
  }
   Future pickImageFromCategory() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage!=null){
      await AuthRemote().updateAvatarClientProfile(stringPathImage: returnImage.path);
    }
  }
}
