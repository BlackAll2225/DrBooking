import 'dart:developer';

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/remote/patient_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/booking/payload/get_appointment_payload.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TabHistoryController extends BaseController {
  //TODO: Implement TabHistoryController
  late BookingApi bookingApi;
  final isProcessSub = false.obs;

  Rx<DateTime> selectedTime = DateTime.now().obs;
  RxList<AppointmentPreview> listBookingPreview = <AppointmentPreview>[].obs;

  RxList<PatientPreview> listPatients = <PatientPreview>[].obs;
  PatientApi profileApi = PatientRemote();
  TextEditingController searchTextController = TextEditingController(text: '');
  ScrollController scroller = ScrollController();
  int take = 10;
  int skip = 0;

  int takeSub = 10;
  int skipSub = 0;
  Rx<PatientPreview> selectedPatient = PatientPreview(fullname: 'Tất cả').obs;

  @override
  Future<void> onInit() async {
    bookingApi = BookingRemote();
    isLoading(true);
    await fetchListBooking();
    scroller.addListener(() async {
      if (scroller.position.pixels == scroller.position.maxScrollExtent) {
        await fetchListBooking();
      }
    });
    isFetchData(false);
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


  swapStatus({required bool isHistory}) async {
    listBookingPreview.value = [];
    skip = 0;
    selectedTime.value = DateTime.now();
    isLoading(true);
    await fetchListBooking();
    isLoading(false);
  }

  fetchAlClients() async {
    log("message");
    try {
      if (!isProcessSub.value) {
        isProcessSub(true);
        List<PatientPreview> listData = await profileApi.getPatients(
            searchName: searchTextController.text,
            take: takeSub,
            skip: skipSub);
        if (listData.isNotEmpty) {
          skipSub += 10;
        }
        listPatients.addAll(listData);
        isProcessSub(false);
      }
    } catch (e) {
      isProcessSub(false);
      log(e.toString());
    }
  }

  fetchPatientsWithSearch() async {
    skipSub = 0;
    listPatients.value = [];
    await fetchAlClients();
  }

  clearText() async {
    skip = 0;
    searchTextController.text = '';
    await fetchPatientsWithSearch();
  }

  fetchListBooking() async {
    isFetchMore(true);
    await Future.delayed(Duration(seconds: 2));
   
      PayloadGetAppointment payload = PayloadGetAppointment(
          monthQuery: DateFormat('yyyy-MM-dd').format(selectedTime.value),
          take: take,
          skip: skip,
          patientProfileId: selectedPatient.value.patientId ?? '');
      await bookingApi.getListAppointmentFinish(payload: payload).then((value) {
        if (value.isNotEmpty) {
          skip += 10;
          listBookingPreview.value.addAll(value);
        }
        isLoading(false);
      }).catchError((error) {
        listBookingPreview.value = [];
        isLoading(false);
        log("err:$error");
        // UtilCommon.snackBar(text: '${error.message}', isFail: true);
      });
    isFetchMore(false);
  }

  onTapProfile(PatientPreview patient) async {
    listBookingPreview.value = [];
    skip = 0;
    selectedPatient.value = patient;
    isLoading(true);
    await fetchListBooking();
    isLoading(false);
  }

  fetchBookingWithTime(DateTime dateTime) async {
    selectedTime.value = dateTime;
    skip = 0;
    isLoading(true);
    listBookingPreview.value = [];
    await fetchListBooking();
    isLoading(false);
  }

  resetPatient() async {
    selectedPatient.value = PatientPreview(fullname: 'Tất cả');
    listBookingPreview.value = [];
    skip = 0;
    isLoading(true);
    await fetchListBooking();
    isLoading(false);
  }
}

