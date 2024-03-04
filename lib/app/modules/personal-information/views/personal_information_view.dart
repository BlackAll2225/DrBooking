import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/common/widget/app_bar_custom.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/form_field_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/personal_information_controller.dart';

class PersonalInformationView extends BaseView<PersonalInformationController> {
  const PersonalInformationView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Column(
          children: [
           AppBarCustom(callback: (){Get.back();}, title: 'Cập Nhật Tài Khoản'),
           SizedBoxConst.size(context: context,size: 20),
            Expanded(
              child: Material(
                child: Container(
                  width: UtilsReponsive.width(375,context, ),
                  height: UtilsReponsive.height(812,context, ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.isLoading.value == true ? SizedBox() : SizedBox(),
                        Center(
                            child: ClipOval(
                                child: Image.asset('assets/images/user1.png',
                                    fit: BoxFit.fill,
                                    height: UtilsReponsive.height(80, context),
                                    width: UtilsReponsive.height(80, context)))),
                        Padding(
                          padding:
                              UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                          child: TextConstant.subTile3(
                            context,
                           text: "Họ & Tên",
                          ),
                        ),
                        Padding(
                          padding: UtilsReponsive.paddingOnly(context,
                              top: 20, right: 20, left: 20),
                          child: FormFieldWidget(
                          setValueFunc: (v){},
                          initValue: 'Nguyễn Văn C',
                             icon : Icon(Icons.person)
                          ),
                        ),
                        Padding(
                          padding:
                              UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                          child:TextConstant.subTile3(
                            context,
                           text:
                            "Email",
                          ),
                        ),
                        Padding(
                            padding: UtilsReponsive.paddingOnly(context,
                                top: 20, right: 20, left: 20),
                            child: FormFieldWidget(
                          setValueFunc: (v){},
                          initValue: "abc@hihi.com",
                             icon : Icon(Icons.person)
                          ),),
                        Padding(
                          padding:
                              UtilsReponsive.paddingOnly(context, top: 30, left: 20),
                          child: TextConstant.subTile3(
                            context,
                           text:
                            "Số Điện Thoại",
                          ),
                        ),
                        Padding(
                          padding: UtilsReponsive.paddingOnly(context,
                              top: 20, right: 20, left: 20),
                          child:FormFieldWidget(
                          setValueFunc: (v){},
                          initValue: '0982 9999 90',
                             icon : Icon(Icons.person)
                          )
                        ),
                      
                        Padding(
                          padding: UtilsReponsive.paddingOnly(context,
                              top: 50, left: 20, right: 20, bottom: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: UtilsReponsive.paddingOnly(context,
                                  top: 15, bottom: 15),
                            ),
            
                            // ignore: sort_child_properties_last
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Lưu Thay Đổi',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onPressed: () async{
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
