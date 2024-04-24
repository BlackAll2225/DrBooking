import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/patient_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/patient_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/model/medical-record/medical_record.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MedicalRecordController extends BaseController {
  //TODO: Implement MedicalRecordController
  RxList<Profile> listProfile = <Profile>[].obs;
  Rx<Profile> selectedProfile = Profile(fullname: 'Tất cả').obs;

  RxList<MedicalRecord> listMedicalRecord = <MedicalRecord>[].obs;

  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;
  late PatientApi profileApi;
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    profileApi = PatientRemote();
    await fetchAlClients();
    await fetchMedicalRecord();
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

  fetchAlClients() async {
    try {
      if (!isFetchData.value) {
        isLoading(true);
        isFetchData(true);
        // listProfile.value = await profileApi.getProfiles(
        //     idAccount: BaseCommon.instance.accountSession!.clientId!);
        selectedProfile.value = listProfile[0];
        isFetchData(false);
        isLoading(false);
      }
    } catch (e) {
      log("hihi" + e.toString());
    }
  }

  onTapProfileCard({required Profile profile}) {
    RequestParamBooking requestParamBooking = RequestParamBooking();
    requestParamBooking.profile = profile;
    Get.toNamed(Routes.BOOKING_PROCESS_BRANCH, arguments: requestParamBooking);
  }

  fetchMedicalRecord() async {
        isFetchData(true);
    await BookingRemote()
        .getListMedicalRecordByIdPatient(patientId: selectedProfile.value.id!)
        .then((value) {
      listMedicalRecord.value = value;
      isFetchData(false);
    }).catchError((error) {
      listMedicalRecord.value = [];
      isFetchData(false);
      log("err:$error");
      UtilCommon.snackBar(text: '${error.message}', isFail: true);
    });
  }
   onTapProfile(Profile profile) async{
    selectedProfile.value = profile;
    await fetchMedicalRecord();
  }
}
