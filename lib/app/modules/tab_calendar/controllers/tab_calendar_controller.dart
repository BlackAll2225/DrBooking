import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/profile_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:get/get.dart';

class TabCalendarController extends BaseController {
  //TODO: Implement TabCalendarController

  final count = 0.obs;
  final isHistory = false.obs;
  late BookingApi bookingApi;
  RxList<AppointmentPreview> listBookingPreview = <AppointmentPreview>[].obs;

  RxList<Profile> listProfile = <Profile>[].obs;
  ProfileApi profileApi = ProfileRemote();
  Rx<Profile> selectedProfile = Profile(fullname: 'Tất cả').obs;
  @override
  Future<void> onInit() async {
    bookingApi = BookingRemote();
    await fetchAlClients();
    await fetchListBooking();

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

  void increment() => count.value++;

  swapStatus({required bool isHistory}) async {
    this.isHistory.value = isHistory;
    await fetchListBooking();
  }

  fetchAlClients() async {
    try {
      if (!isFetchData.value) {
        isLoading(true);
        isFetchData(true);
        listProfile.value = await profileApi.getProfiles(
            idAccount: BaseCommon.instance.accountSession!.clientId);
            selectedProfile.value = listProfile[0];
        isFetchData(false);
        isLoading(false);
      }
    } catch (e) {
      log("hihi"+ e.toString());
    }
  }

  fetchListBooking() async {
    isLoading(true);
    if (!isHistory.value) {
      await bookingApi
          .getListAppointmentComming(
              BaseCommon.instance.accountSession!.clientId, selectedProfile.value.id ?? '')
          .then((value) {
        listBookingPreview.value = value;
        isLoading(false);
      }).catchError((error) {
        listBookingPreview.value = [];
        isLoading(false);
        log("err:$error");
        // UtilCommon.snackBar(text: '${error.message}', isFail: true);
      });
    } else {
      await bookingApi
          .getListAppointmentFinish(
              BaseCommon.instance.accountSession!.clientId, selectedProfile.value.id ?? '')
          .then((value) {
        listBookingPreview.value = value;
        isLoading(false);
      }).catchError((error) {
        listBookingPreview.value = [];
        isLoading(false);
        log("err:$error");
        // UtilCommon.snackBar(text: '${error.message}', isFail: true);
      });
    }
  }

  onTapProfile(Profile profile) async{
    selectedProfile.value = profile;
    await fetchListBooking();
  }
}
