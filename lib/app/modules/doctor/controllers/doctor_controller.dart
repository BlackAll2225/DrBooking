import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/doctor_local.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:get/get.dart';

class DoctorController extends BaseController {
  final isLocal = BaseCommon.instance.mode == LOCAL_MODE;

  //TODO: Implement DoctorController
  late DoctorApi doctorApi ;
  RxList<DoctorPreview> listDoctorPreview = <DoctorPreview>[].obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    doctorApi = isLocal? DoctorLocal():DoctorRemote();
    await initalData();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initalData() async {
    try {
      getListDoctorRandom();
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

   getListDoctorRandom() async {
    isLoading.value = true;
    listDoctorPreview.value = await doctorApi.getListDoctorRandom();
    isLoading.value = false;
  }

}
