import 'package:cached_network_image/cached_network_image.dart';
import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/loading_widget.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/text_style.dart';
import 'package:drbooking/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/tab_patient_controller.dart';

class TabPatientView extends BaseView<TabPatientController> {
  const TabPatientView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Center(
                      child:
                          TextConstant.titleH3(context, text: 'Quản lý hồ sơ')),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        controller.onTapCreateButton();
                      },
                      child: Icon(
                        Icons.add,
                        color: ColorsManager.primary,
                      )),
                )
              ],
            ),
            SizedBoxConst.size(context: context, size: 20),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    onChanged: (value) async {
                      await controller.fetchWithSearch();
                    },
                    controller: controller.searchTextController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: UtilsReponsive.height(5, context),
                          horizontal: UtilsReponsive.height(15, context)),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            await controller.clearText();
                          },
                          icon: Icon(Icons.close)),
                      // contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              UtilsReponsive.height(10, context))),
                      hintText: 'Nhập tên để tìm kiếm',
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: LoadingWidget())
                  : Expanded(
                      child: Obx(
                        () => (!controller.isFetchMore.value &&
                                controller.listPatients.value.isEmpty)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.not_interested_outlined,
                                    size: UtilsReponsive.height(100, context),
                                    color: Colors.grey,
                                  ),
                                  TextConstant.titleH3(context,
                                      text: "Không có dữ liệu",
                                      color: Colors.grey),
                                ],
                              )
                            : ListView.separated(
                                controller: controller.scroller,
                                padding: EdgeInsets.only(
                                    top: UtilsReponsive.height(10, context)),
                                itemCount:
                                    controller.listPatients.value.length + 1,
                                separatorBuilder: (context, index) =>
                                    SizedBoxConst.size(context: context),
                                itemBuilder: (context, index) {
                                  if (index ==
                                      controller.listPatients.value.length) {
                                    return Obx(
                                        () => controller.isFetchMore.value
                                            ? CupertinoActivityIndicator(
                                                color: ColorsManager.primary,
                                              )
                                            : SizedBox());
                                  }
                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.PROFILE_DETAIL,
                                            parameters: {
                                              "idPatient": controller
                                                  .listPatients
                                                  .value[index]
                                                  .patientId!
                                            });
                                      },
                                      child: _cardProfile(context,
                                          profile: controller
                                              .listPatients.value[index]));
                                }),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Container _cardProfile(BuildContext context,
      {required PatientPreview profile}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      // margin: EdgeInsets.symmetric(
      //   horizontal: UtilsReponsive.height(10, context),
      // ),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      width: double.infinity,
      height: UtilsReponsive.width(100, context),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorsManager.primary.withOpacity(0.5),
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            margin: EdgeInsets.symmetric(
              horizontal: UtilsReponsive.height(10, context),
            ),
            width: UtilsReponsive.width(70, context),
            height: UtilsReponsive.width(70, context),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: profile.avatarUrl ?? '',
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.white,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(ImageAssets.logo),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextConstant.subTile1(context,
                  text: profile.fullname ?? '', fontWeight: FontWeight.bold),
              SizedBoxConst.size(context: context),
              TextConstant.subTile2(context,
                  text: DateFormat('dd/MM/yyyy')
                      .format(profile.dateOfBirth ?? DateTime.now()),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)
            ],
          ))
        ],
      ),
    );
  }
}
