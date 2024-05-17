import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/doctor_local.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:get/get.dart';

class DoctorDetailController extends BaseController {
  //TODO: Implement DoctorDetailController
  DoctorDetailController({required this.idDoctor});
  final idDoctor;
  final count = 0.obs;
  final isFeedback =false.obs;
  DoctorApi doctorApi = BaseCommon.instance.mode == LOCAL_MODE ? DoctorLocal(): DoctorRemote();

  late Rx<Doctor> doctor = Doctor().obs;
  @override
  Future<void> onInit() async {
    await fetchDataDoctor();
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

 updateTabFeedBack(bool value){
  isFeedback.value = value;
 }

 fetchDataDoctor() async{
  await doctorApi.getDoctorDetailById(id: idDoctor).then((value){
    doctor.value = value;
  }).catchError((error){
      log("err"+ error.toString());
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
  });
  log(jsonEncode(doctor.value));
 }
}
