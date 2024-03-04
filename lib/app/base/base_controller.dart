import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class BaseController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> isFetchData = false.obs;
  Rx<bool> isLockButton = false.obs;
}