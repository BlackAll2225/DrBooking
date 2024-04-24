import 'dart:async';
import 'dart:developer';

import 'package:drbooking/app/resources/util_common.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class BaseController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isFetchData = false.obs;
  Rx<bool> isFetchMore = false.obs;
  Rx<bool> isLockButton = false.obs;

  FutureOr<Null> handleError(dynamic error) async{
  log(error.toString());
  isLockButton(false);
  UtilCommon.snackBar(text: '${error.message}', isFail: true);
}
}