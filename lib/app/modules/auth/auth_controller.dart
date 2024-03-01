// import 'package:drbooking/app/base/base_common.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  Rx<bool> isRefreshing = false.obs;

  refreshAccessToken()async{
    // await BaseCommon.instance.saveToken();
    return true;
  }



}