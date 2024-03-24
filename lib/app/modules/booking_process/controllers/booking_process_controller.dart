import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/request_booking.dart';
import 'package:drbooking/app/model/service/button_service.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingProcessController extends BaseController {
  //TODO: Implement BookingProcessController
  BookingProcessController({required this.requestParamBooking});
  final RequestParamBooking requestParamBooking;

  DoctorApi doctorApi = DoctorRemote();

  RxList<Clinic> listClinic = <Clinic>[].obs;
  Rx<Clinic> selectedClinic =
      Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh').obs;

  RxList<Specialty> listSpecialty = <Specialty>[].obs;
  Rx<Specialty> selectedSpecialty =
      Specialty(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh').obs;

  RxList<Doctor> listDoctors = <Doctor>[].obs;
  Rx<Doctor> selectedDoctor = Doctor.emptyFactory().obs;
  
  Rx<RequestParamBooking> requestData = RequestParamBooking().obs;

  @override
  Future<void> onInit() async {
    requestData.value = requestParamBooking;
    selectedClinic.value = requestParamBooking.clinic ??
        Clinic(createdAt: DateTime.now(), name: 'Vui lòng chọn chi nhánh');
    selectedSpecialty.value = requestParamBooking.specialty ??
        Specialty(createdAt: DateTime.now(), name: 'Vui lòng chọn chuyên khoa');
    await fetchDataClinic();
    await fetchDataDoctor(idClinic: requestParamBooking.clinic!.id);
    await fetchDataSpecialtys(idClinic: requestParamBooking.clinic!.id);
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
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) {
      listClinic.value = value;
    });
  }

  fetchDataSpecialtys({required String idClinic}) async {
    //reset selected
    selectedSpecialty.value =
        Specialty(createdAt: DateTime.now(), name: 'Vui lòng chọn chuyên khoa');
    await doctorApi
        .getListSpecialtyByIdClinic(idClinic: idClinic)
        .then((value) {
      listSpecialty.value = value;
    });
  }
  onTapCardDoctor(Doctor doctor){
    selectedDoctor.value = doctor;
  }

  fetchDataDoctor({required String idClinic}) async {
    await doctorApi.getListDoctorRandom(param: idClinic).then((value) {
      listDoctors.value = value;
    });
  }

 onTapClinic(Clinic clinic) async {
    selectedClinic.value = clinic;
    await fetchDataSpecialtys(idClinic: clinic.id);
    await fetchDataDoctor(idClinic: clinic.id);
  }
  showBottomBranch() async {
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
          TextConstant.subTile1(Get.context!, text: 'Chi nhánh'),
          Expanded(
              child: ListView.builder(
            itemCount: listClinic.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                onTapClinic(listClinic[index]);
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextConstant.subTile2(context,
                          text: listClinic[index].name),
                      listClinic[index] == selectedClinic.value
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

  onTapSpecial(Specialty specialty) async {
    selectedSpecialty.value = specialty;
  }

  onTapCalendar()async{

  }

  showBottomSpecial() async {
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
          TextConstant.subTile1(Get.context!, text: 'Chuyên khoa'),
          Expanded(
              child: ListView.builder(
            itemCount: listSpecialty.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                onTapSpecial(listSpecialty[index]);
                Get.back();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: UtilsReponsive.height(15, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextConstant.subTile2(context,
                            text: listSpecialty[index].name),
                      ),
                      listSpecialty[index] == selectedSpecialty.value
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
}
