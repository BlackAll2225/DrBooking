import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/remote/auth_remote.dart';
import 'package:drbooking/app/model/auth/account_session.dart';
import 'package:drbooking/app/model/nav_account.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TabAccountController extends BaseController {
  //TODO: Implement TabAccountController

  final count = 0.obs;
  List<NavAccount> listNav = [
    NavAccount(title: 'Thông tin tài khoản', icon: Icon(Icons.person, color: ColorsManager.primary,), path: Routes.PERSONAL_INFORMATION, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Lịch sử', icon: Icon(Icons.history,color: ColorsManager.primary), path: '', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Đổi mật khẩu', icon: Icon(Icons.password,color: ColorsManager.primary), path: Routes.CHANGE_PASSWORD, textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Các chi nhánh', icon: Icon(Icons.location_city_outlined, color: ColorsManager.primary), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    ,NavAccount(title: 'Trung tâm trợ giúp', icon: Icon(Icons.phone, color: ColorsManager.primary), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
    // ,NavAccount(title: 'Thông tin chung', icon: Icon(Icons.info, color: ColorsManager.primary), path: 'path', textColor: Colors.black, backgroundColor:ColorsManager.primary)
  ];
 Rx<AccountSession> account = AccountSession().obs;
  @override
  Future<void> onInit() async {
    account.value = BaseCommon.instance.accountSession!;
    isLoading(false);
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
  Future pickImageFromCategory() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      await AuthRemote()
          .updateAvatarClientProfile(stringPathImage: returnImage.path)
          .then((jwt) async {
        await BaseCommon.instance.saveToken(jwt);
        await BaseCommon.instance.decodeJWT();
            account.value = BaseCommon.instance.accountSession!;
            UtilCommon.snackBar(text: 'Cập nhật thành công');
      });
    }
  }
}
