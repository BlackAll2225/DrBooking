import 'package:drbooking/app/base/base_bindings.dart';
import 'package:get/get.dart';

import '../controllers/map_explore_controller.dart';

class MapExploreBinding extends BaseBindings {
  @override
  void injectService() {
    Get.lazyPut<MapExploreController>(
      () => MapExploreController(),
    );
  }
}
