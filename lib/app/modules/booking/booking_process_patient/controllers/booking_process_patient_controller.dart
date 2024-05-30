import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/patient_local.dart';
import 'package:drbooking/app/data/remote/patient_remote.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BookingProcessPatientController extends BaseController {
  //TODO: Implement BookingController
  RxList<PatientPreview> listPatients = <PatientPreview>[].obs;
  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;
  late PatientApi profileApi;
  @override
  Future<void> onInit() async {
    profileApi = isLocal ? PatientLocal() : PatientRemote();
    // profileApi = ProfileRemote();
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

  initData() async {
    try {
      isLoading(true);
      listPatients.value = await profileApi.getPatients(searchName: '', take: 100, skip: 0);
      isLoading(false);
    } catch (e) {}
  }

  onTapProfileCard({required PatientPreview patient}) {
    RequestParamBooking requestParamBooking = RequestParamBooking();
    requestParamBooking.patient = patient;
    Get.toNamed(Routes.BOOKING_PROCESS_CLINIC, arguments: requestParamBooking);
  }
}
