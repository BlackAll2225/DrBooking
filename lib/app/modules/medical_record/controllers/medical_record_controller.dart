import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/profile_local.dart';
import 'package:drbooking/app/data/remote/profile_remote.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MedicalRecordController extends BaseController {
  //TODO: Implement MedicalRecordController
  RxList<Profile> listProfile = <Profile>[].obs;
  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;
  late ProfileApi profileApi;
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    profileApi = isLocal ? ProfileLocal() : ProfileRemote();
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
      listProfile.value = await profileApi.getProfiles(idAccount: BaseCommon.instance.accountSession!.clientId);
      isLoading(false);
    } catch (e) {}
  }
    onTapProfileCard({required Profile profile}) {
    RequestParamBooking requestParamBooking = RequestParamBooking();
    requestParamBooking.profile = profile;
    Get.toNamed(Routes.BOOKING_PROCESS_BRANCH, arguments: requestParamBooking);
  }
}
