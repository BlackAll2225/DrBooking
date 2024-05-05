import 'dart:developer';

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/address_api.dart';
import 'package:drbooking/app/model/address/district.dart';
import 'package:drbooking/app/model/address/province.dart';
import 'package:drbooking/app/model/address/ward.dart';
import 'package:drbooking/app/model/patient/request_body_create_patient.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileDetailController extends BaseController {
  ProfileDetailController({required this.idPatient});
  final String idPatient;
   TextEditingController nameTextController = TextEditingController(text: '');
  TextEditingController phoneTextController = TextEditingController(text: '');
  TextEditingController birthTextController =
      TextEditingController(text: 'Chọn');
  TextEditingController genderTextController = TextEditingController(text: '');
  TextEditingController addressTextController = TextEditingController(text: '');
  TextEditingController bhtyTextController = TextEditingController(text: '');
  TextEditingController bhytExpTextController =
      TextEditingController(text: 'Chọn');
  TextEditingController bhtyAddressTextController =
      TextEditingController(text: '');
  TextEditingController cccdTextController = TextEditingController(text: '');
  TextEditingController cccdDateTextController =
      TextEditingController(text: 'Chọn');
  TextEditingController cccdAddressTextController =
      TextEditingController(text: '');

  Rx<String> nameError = ''.obs;
  Rx<String> phoneError = ''.obs;
  Rx<String> birthError = ''.obs;
  Rx<String> genderError = ''.obs;
  Rx<String> addressError = ''.obs;
  Rx<String> bhtyError = ''.obs;
  Rx<String> bhytExpError = ''.obs;
  Rx<String> bhtyAddressError = ''.obs;
  Rx<String> cccdError = ''.obs;
  Rx<String> cccdDateError = ''.obs;
  Rx<String> cccdAddressError = ''.obs;

  Rx<DateTime> dateCurrent = DateTime.now().obs;
  Rx<DateTime> dateBHYTExp = DateTime.now().obs;
  Rx<DateTime> dateCCCDDate = DateTime.now().obs;
  Rx<Gender> selectedGender = listGender[0].obs;

  PageController pageController = PageController();
  final indexPage = 0.obs;

  RxList<Province> listProvince = <Province>[].obs;
  RxList<District> listDistrict = <District>[].obs;
  RxList<Ward> listWard = <Ward>[].obs;

  Rx<Province> selectedProvince = Province().obs;
  Rx<District> selectedDistrict = District().obs;
  Rx<Ward> selectedWard = Ward().obs;

  final isLockUpdate = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setValueBirth(DateTime date) {
    dateCurrent.value = date;
    birthTextController.text = UtilCommon.convertDateTime(date);
  }

  setValueCccdDate(DateTime date) {
    dateCCCDDate.value = date;
    cccdDateTextController.text = UtilCommon.convertDateTime(date);
  }

  setValueBhytDate(DateTime date) {
    dateBHYTExp.value = date;
    bhytExpTextController.text = UtilCommon.convertDateTime(date);
  }


  createProfile() async {
    String fullName = nameTextController.text;
    String address = addressTextController.text;
    String bhyt = bhtyTextController.text;
    String bhytExp = bhytExpTextController.text;
    String bhytAddress = bhtyAddressTextController.text;
    String cccd = cccdTextController.text;
    String cccdDate = cccdDateTextController.text;
    String cccdAddress = cccdAddressTextController.text;
    BodyRequestCreatePatient bodyRequestCreatePatient =
        BodyRequestCreatePatient();

    bodyRequestCreatePatient.phoneNumber = phoneTextController.text;
    bodyRequestCreatePatient.fullname = fullName;
    bodyRequestCreatePatient.dateOfBirth = DateFormat('yyyy-MM-dd').format(dateCurrent.value);
    bodyRequestCreatePatient.clientId = BaseCommon.instance.accountSession!.clientId;
    bodyRequestCreatePatient.biologicalGender = selectedGender.value.id;
//Insurence
    if(cccdTextController.text.isNotEmpty){
      bodyRequestCreatePatient.idCode = cccdTextController.text;
      bodyRequestCreatePatient.idIssuedDate = DateFormat('yyyy-MM-dd').format(dateCCCDDate.value);
      bodyRequestCreatePatient.idIssuedPlace = cccdAddressTextController.text;
    }

    if(bhtyTextController.text.isNotEmpty){
      bodyRequestCreatePatient.healthInsuranceCode = bhtyTextController.text;
      bodyRequestCreatePatient.hiIssuedPlace = bhtyAddressTextController.text;
      bodyRequestCreatePatient.expiredDate = DateFormat('yyyy-MM-dd').format(dateBHYTExp.value);
    }
//CodePerson
    bodyRequestCreatePatient.district = selectedDistrict.value.districtName;
    bodyRequestCreatePatient.province = selectedProvince.value.provinceName;
    bodyRequestCreatePatient.ward = selectedWard.value.wardName;
    bodyRequestCreatePatient.addressLine = address;
    // await PatientRemote()
    //     .createNewProfile(bodyRequest: bodyRequestCreatePatient)
    //     .then((value) {
    //   // if (value) {
    //   //   Get.offAllNamed(Routes.HOME);
    //   //   UtilCommon.snackBar(text: 'Tạo hồ sơ thành công');
    //   // }
    // }).catchError((error) {
    //   log("err:$error");
    //   isLockButton(false);
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }

  bool validateName() {
    if (nameTextController.text.isEmpty) {
      nameError('Tên không được để trống');
      return false;
    }
    nameError('');
    return true;
  }

  bool validateAddress() {
    if (selectedProvince.value.provinceName == null ||
        selectedDistrict.value.districtName == null ||
        selectedWard.value.wardName == null) {
      addressError('Bạn cần chọn đủ thông tin địa chỉ');
      return false;
    }
    addressError('');
    return true;
  }

  bool validateBirth() {
    if (birthTextController.text == 'Chọn') {
      birthError('Ngày sinh không được để trống');
      return false;
    }
    birthError('');
    return true;
  }

  bool validateCccd() {
    if (cccdTextController.text.isNotEmpty ||
        cccdAddressTextController.text.isNotEmpty ||
        cccdDateTextController.text != 'Chọn') {
      if (cccdTextController.text.isEmpty ||
          cccdAddressTextController.text.isEmpty ||
          cccdDateTextController.text == 'Chọn') {
        cccdError(
            'Vui lòng nhập đầy đủ hết thông tin CMND/CCCD. Hoặc bỏ qua bằng cách ấn ');
        return false;
      }
    }
    cccdError('');
    return true;
  }

  bool validatePhone() {
    if (!GetUtils.isPhoneNumber(phoneTextController.text) &&
        phoneTextController.text.length != 10) {
      phoneError('Số điện thoại không hợp lệ');
      return false;
    }
    phoneError("");
    return true;
  }

  bool validateBhyt() {
    if (bhtyTextController.text.isNotEmpty ||
        bhtyAddressTextController.text.isNotEmpty ||
        bhytExpTextController.text != 'Chọn') {
      if (bhtyTextController.text.isEmpty ||
          bhtyAddressTextController.text.isEmpty ||
          bhytExpTextController.text == 'Chọn') {
        bhtyError(
            'Vui lòng nhập đầy đủ hết thông tin BHYT. Hoặc bỏ qua bằng cách ấn ');
        return false;
      }
    }
    bhtyError('');
    return true;
  }

  bool validationBasicInfor() {
    validateName();
    validateAddress();
    validateBirth();
    validateCccd();
    validatePhone();
    if (addressError.isEmpty &&
        nameError.isEmpty &&
        birthError.isEmpty && phoneError.isEmpty &&
        cccdError.isEmpty) {
      return true;
    }
    return false;
  }

  bool validateInforMore() {
    validateBhyt();
    if (bhtyError.isEmpty) {
      return true;
    }
    return false;
  }

  resetCccd() {
    cccdError('');
    dateCCCDDate(DateTime.now());
    cccdDateTextController.text = 'Chọn';
    cccdAddressTextController.text = '';
    cccdTextController.text = '';
  }

  resetBhyt() {
    bhtyError('');
    dateBHYTExp(DateTime.now());
    bhytExpTextController.text = 'Chọn';
    bhtyTextController.text = '';
    bhtyAddressTextController.text = '';
  }

  fetchDataProvince() async {
    isFetchData(true);
    selectedDistrict.value = District();
    selectedWard.value = Ward();
    await AddressApi.getProvince().then((value) {
      listProvince.value = value;
      isFetchData(false);
    }).catchError((error) {
      log("err:$error");
      isLockButton(false);
      isFetchData(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  fetchDataDistrict() async {
    isFetchData(true);
    await Future.delayed(Duration(seconds: 2));
    await AddressApi.getDistrictByIdProvince(
            idProvince: selectedProvince.value.provinceId!)
        .then((value) {
      listDistrict.value = value;
      isFetchData(false);
    }).catchError((error) {
      isFetchData(false);
      log("err:$error");
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
  }

  fetchDataWard() async {
    isFetchData(true);
    await AddressApi.getWardByIdDistrict(
            idDistrict: selectedDistrict.value.districtId!)
        .then((value) {
      listWard.value = value;
      isFetchData(false);
    });
  }

  updateProfile() async {
    String fullName = nameTextController.text;
    String birthDate = birthTextController.text;
    String gender = genderTextController.text;
    String address = addressTextController.text;
    String bhyt = bhtyTextController.text;
    String bhytExp = bhytExpTextController.text;
    String bhytAddress = bhtyAddressTextController.text;
    String cccd = cccdTextController.text;
    String cccdDate = cccdDateTextController.text;
    String cccdAddress = cccdAddressTextController.text;
    // await PatientRemote().updateProfile(idPatient: 'idPatient').then((value) {
    //   nameTextController.text;
    //   birthTextController.text;
    //   genderTextController.text;
    //   addressTextController.text;
    //   bhtyTextController.text;
    //   bhytExpTextController.text;
    //   bhtyAddressTextController.text;
    //   cccdTextController.text;
    //   cccdDateTextController.text;
    //   cccdAddressTextController.text;
    // }).catchError((error) {
    //   UtilCommon.snackBar(text: '${error.message}');
    // });
  }

  // initData() async {
  //   isLoading(true);
  //    await PatientRemote().getProfileDetailById(idPatient: idPatient).then((value) {
  //     nameTextController.text = value.fullname ?? '';
  //     birthTextController.text = UtilCommon.convertDateTime(value.dateOfBirth!);
  //     genderTextController.text = value.biologicalGender == 0 ? 'Nữ' : 'Nam';
  //     addressTextController.text = value.nameAddress ?? '';
  //     bhtyTextController.text = value.healthInsuranceCode ?? '';
  //     bhytExpTextController.text = value.idIssuedDate != null
  //         ? UtilCommon.convertDateTime(value.idIssuedDate!)
  //         : '';
  //     bhtyAddressTextController.text = value.hiIssuedPlace ?? '';
  //     cccdTextController.text = value.idCode ?? '';
  //     cccdDateTextController.text = value.expiredDate != null
  //         ? UtilCommon.convertDateTime(value.expiredDate!)
  //         : '';
  //     cccdAddressTextController.text = value.idIssuedPlace ?? '';
  //   }).catchError((error) {
  //     isLoading(false);

  //     log(error.toString());
  //     UtilCommon.snackBar(text: '${error.message}', isFail: true);
  //   });
  //   isLoading(false);
  // }

  onTapEdit() {
    isLockUpdate(false);
  }
  onTapCancel() {
    isLockUpdate(true);
  }
   onTapUpdate() async{
    isLockUpdate(true);
  }
}
