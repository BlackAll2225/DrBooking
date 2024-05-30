import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/doctor_local.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/branch.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BookingProcessClinicController extends BaseController {
  BookingProcessClinicController({required this.requestParamBooking});
  RxList<Clinic> listClinic = <Clinic>[].obs;
  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;
  late DoctorApi doctorApi;
  RequestParamBooking requestParamBooking;
  @override
  Future<void> onInit() async {
    doctorApi = DoctorRemote();
    await fetchDataClinic();
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

  fetchDataClinic() async {
    isLoading(true);
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) {
      listClinic.value = value;
    }).catchError(handleError);
    isLoading(false);
  }

  onTapClinicCard({required Clinic clinic}) {
    requestParamBooking.clinic = clinic;
    Get.toNamed(Routes.BOOKING_PROCESS_SERVICE, arguments: requestParamBooking);
  }
}
