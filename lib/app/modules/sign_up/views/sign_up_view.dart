import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends BaseView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          // color: ColorsManager.primary.withOpacity(0.15),
          child: SingleChildScrollView(
               padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: UtilsReponsive.height(200, context),
                        width: double.infinity,
                        child: Center(
                          child: Image(
                            image: AssetImage(ImageAssets.logo),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    SizedBoxConst.size(context: context, size: 20),
                    TextConstant.subTile2(
                      context,
                      text: 'Họ và tên',
                    ),
                    SizedBoxConst.size(context: context, size: 5),
                    Obx(
                      () => FormFieldWidget(
                          isEnabled: !controller.isLockButton.value,
                          controllerEditting: controller.nameTextController,
                          radiusBorder: 10,
                          borderColor: ColorsManager.primary,
                          padding: 10,
                          textInputType: TextInputType.text,
                          errorText: "${controller.errorNameInput}",
                          setValueFunc: (value) => controller.validateName()),
                    ),
                    SizedBoxConst.size(context: context, size: 20),
                    TextConstant.subTile2(
                      context,
                      text: 'Số điện thoại',
                    ),
                    SizedBoxConst.size(context: context, size: 5),
                    Obx(
                      () => FormFieldWidget(
                          isEnabled: !controller.isLockButton.value,
                          controllerEditting: controller.phoneTextController,
                          radiusBorder: 10,
                          borderColor: ColorsManager.primary,
                          padding: 10,
                          textInputType: TextInputType.number,
                          errorText: "${controller.errorPhoneInput}",
                          setValueFunc: (value) => controller.validatePhone()),
                    ),
                    SizedBoxConst.size(context: context, size: 15),
                    TextConstant.subTile2(
                      context,
                      text: 'Email',
                    ),
                    SizedBoxConst.size(context: context, size: 5),
                    Obx(
                      () => FormFieldWidget(
                          isEnabled: !controller.isLockButton.value,
                          controllerEditting: controller.emailController,
                          radiusBorder: 10,
                          borderColor: ColorsManager.primary,
                          padding: 10,
                          textInputType: TextInputType.emailAddress,
                          errorText: "${controller.errorEmail}",
                          setValueFunc: (value) => controller.validateEmail()),
                    ),
                    SizedBoxConst.size(context: context, size: 15),
                    TextConstant.subTile2(
                      context,
                      text: 'Mật khẩu',
                    ),
                    SizedBoxConst.size(context: context, size: 5),
                    Obx(
                      () => FormFieldWidget(
                          isEnabled: !controller.isLockButton.value,
                          borderColor: ColorsManager.primary,
                          controllerEditting: controller.passwordTextController,
                          radiusBorder: 10,
                          padding: 10,
                          enableInteractiveSelection: false,
                          isObscureText: controller.checkpassword.value,
                          suffixIcon: IconButton(
                            icon: Icon(controller.checkpassword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.checkpassword.value =
                                  !controller.checkpassword.value;
                            },
                          ),
                          textInputType: TextInputType.text,
                          errorText: "${controller.errorPasswordInput}",
                          setValueFunc: (value) =>
                              controller.validatePassword()),
                    ),
                    SizedBoxConst.size(context: context, size: 15),
                    TextConstant.subTile2(
                      context,
                      text: 'Nhập lại khẩu',
                    ),
                    SizedBoxConst.size(context: context, size: 5),
                    Obx(
                      () => FormFieldWidget(
                          isEnabled: !controller.isLockButton.value,
                          borderColor: ColorsManager.primary,
                          controllerEditting:
                              controller.rePasswordTextController,
                          radiusBorder: 10,
                          padding: 10,
                          enableInteractiveSelection: false,
                          isObscureText: controller.checkpassword.value,
                          suffixIcon: IconButton(
                            icon: Icon(controller.checkpassword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.checkpassword.value =
                                  !controller.checkpassword.value;
                            },
                          ),
                          textInputType: TextInputType.text,
                          errorText: "${controller.errorPasswordInput}",
                          setValueFunc: (value) =>
                              controller.validatePassword()),
                    ),
                    SizedBoxConst.size(context: context, size: 15),
                    Obx(
                      () => ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: context.width,
                            height: UtilsReponsive.height(50, context)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                controller.enableButton.isTrue
                                    ? ColorsManager.primary
                                    : Colors.grey),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14)),
                          ),
                          child: Obx(
                            () => controller.isLockButton.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : TextConstant.subTile2(
                                    context,
                                    text: 'Đăng kí',
                                    color: Colors.white,
                                  ),
                          ),
                          onPressed: () async {
                            await controller.signUp();
                          },
                        ),
                      ),
                    ),
                    SizedBoxConst.size(context: context, size: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextConstant.subTile3(context,
                            text: 'Đã có tài khoản?',
                            fontWeight: FontWeight.w500),
                        SizedBoxConst.sizeWith(context: context),
                        TextButton(
                          child: TextConstant.subTile3(context,
                              text: 'Đăng nhập', color: ColorsManager.primary),
                          onPressed: () {
                            Get.back();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
