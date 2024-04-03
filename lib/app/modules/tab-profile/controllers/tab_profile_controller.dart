import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/profile_remote.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TabProfileController extends BaseController {
  //TODO: Implement TabProfileController

  RxList<Profile> listProfile = <Profile>[].obs;
  ProfileApi profileApi = ProfileRemote();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchAlClients();
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
        listProfile.value = await profileApi.getProfiles(
            idAccount: BaseCommon.instance.accountSession!.clientId);
        isFetchData(false);
        isLoading(false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  onTapCreateButton() {
    Get.toNamed(Routes.NEW_PROFILE);
  }
}
