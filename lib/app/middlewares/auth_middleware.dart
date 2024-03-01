import 'package:drbooking/app/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthController authController = Get.find();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (!isTokenExpired()) {
      if (!authController.isRefreshing.value) {
        bool success = await authController.refreshAccessToken();
        authController.isRefreshing.value = false;
        if (!success) {
          return GetNavConfig.fromRoute('/login');
        }
      }
    }
    return null;
  }

  bool isTokenExpired() {
    return true;
  }
}
