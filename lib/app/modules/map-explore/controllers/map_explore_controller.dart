import 'dart:developer';
import 'dart:ui' as ui;

import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/doctor_local.dart';
import 'package:drbooking/app/data/remote/doctor_remote.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:drbooking/app/resources/util_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapExploreController extends BaseController {
  //TODO: Implement MapExploreController
  final count = 0.obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> lng = 0.0.obs;
  Rx<String> textSearch = ''.obs;
  late GoogleMapController mapController;
  RxList<Marker> listMarker = <Marker>[].obs;

  RxList<Clinic> listClinic = <Clinic>[].obs;
  late DoctorApi doctorApi =
      BaseCommon.instance.mode == LOCAL_MODE ? DoctorLocal() : DoctorRemote();

  late BitmapDescriptor customIcon;
  @override
  Future<void> onInit() async {
    await fetchDataClinic();
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

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateMapCamera(double lat, double long) async {
    mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    // await GarageApi.searchGarage(lat, long);
  }

  Future<void> createCustomMarkerIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(22, 22)), // Kích thước biểu tượng
      'assets/images/logo.png', // Đường dẫn đến tệp hình ảnh biểu tượng tùy chỉnh
    );
  }

  Future<Uint8List> getBytesFromAsset() async {
    ByteData data = await rootBundle.load('assets/images/mecical-check.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  fetchDataClinic() async {
    isLoading(true);
    await doctorApi.getListClinic(param: "take=10&&skip=0").then((value) async {
      listClinic.value = value;
      await createCustomMarkerIcon();
      await createMarkerOnMap();
    }).catchError((error) {
      isLoading(false);
      log("err" + error.toString());
      isLockButton(false);
      UtilCommon.snackBar(text: '${error.message}');
    });
    isLoading(false);
  }

  Future<void> createMarkerOnMap() async {
    final Uint8List markerIcon = await getBytesFromAsset();
    listClinic.forEach((element) { 
         listMarker.add(Marker(
      infoWindow: InfoWindow(title: element.name),
      markerId: MarkerId('1212'),
      icon: BitmapDescriptor.fromBytes(markerIcon),
      position:  LatLng(element.latitude, element.longtitude),
      onTap: () {
        Get.bottomSheet(
            Container(
              height: UtilsReponsive.height(200, Get.context!),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UtilsReponsive.height(
                        30,
                        Get.context!,
                      )),
                      topRight: Radius.circular(UtilsReponsive.height(
                        30,
                        Get.context!,
                      )))),
              child: Column(children: [
                Container(
                  height: 5,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  color: Colors.grey,
                  width: UtilsReponsive.width(
                    50,
                    Get.context!,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 8,
                          child: ListTile(
                            leading: Image.asset(
                              ImageAssets.logo,
                              fit: BoxFit.fill,
                              height: UtilsReponsive.height(
                                80,
                                Get.context!,
                              ),
                              width: UtilsReponsive.height(
                                80,
                                Get.context!,
                              ),
                            ),
                            title: Text(element.name,
                                style: TextStyle(
                                    fontSize: UtilsReponsive.height(
                                        16, Get.context!))),
                            subtitle: Text(element.fullAddress),
                          )),
                      Expanded(child: SizedBox())
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: UtilsReponsive.width(
                          80,
                          Get.context!,
                        )),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: ColorsManager.primary),
                        ),
                        backgroundColor: ColorsManager.primary,
                      ),
                      child: Text(
                        "Đặt lịch ngay",
                        style: TextStyle(
                            fontSize: UtilsReponsive.height(16, Get.context!)),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            barrierColor: Colors.transparent);
      },
    ));
    });
   
  }
}
