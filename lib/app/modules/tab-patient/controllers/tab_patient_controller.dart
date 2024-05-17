import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/patient_remote.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TabPatientController extends BaseController {
  //TODO: Implement TabProfileController

  RxList<PatientPreview> listPatients = <PatientPreview>[].obs;
  PatientApi profileApi = PatientRemote();
  TextEditingController searchTextController = TextEditingController(text: '');
  ScrollController scroller = ScrollController();
  int take = 0;
  int skip = 0;

  @override
  Future<void> onInit() async {
     scroller.addListener(() async {
      if (scroller.position.pixels == scroller.position.maxScrollExtent) {
        await fetchAllPatients();
      }
    });
    isLoading(true);
    await fetchAllPatients();
    super.onInit();
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchAllPatients() async {
    try {
      if (!isFetchMore.value) {
        isFetchMore(true);
        List<PatientPreview> listData = await profileApi.getPatients(
            searchName: searchTextController.text, take: take + 10, skip: skip);
        if (listData.isNotEmpty) {
          take += 10;
          skip += 10;
        }
        listPatients.addAll(listData);
      }
      isFetchMore(false);
    } catch (e) {
      isFetchMore(false);
      log(e.toString());
    }
  }

  fetchWithSearch() async {
    take = 0;
    skip = 0;
    listPatients.value.clear();
    await fetchAllPatients();
  }

  clearText() async {
    take = 0;
    skip = 0;
    searchTextController.text = '';
    await fetchWithSearch();
  }

  onTapCreateButton() {
    Get.toNamed(Routes.NEW_PROFILE);
  }
}
