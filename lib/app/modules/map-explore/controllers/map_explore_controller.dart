import 'dart:ui' as ui;

import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/resources/assets_manager.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
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

  Rx<bool> isLoading = true.obs;
  late BitmapDescriptor customIcon;
  @override
  Future<void> onInit() async {
    Future.delayed(
      Duration(seconds: 2),
      () {
        isLoading.value = false;
      },
    );
   
   await createCustomMarker();
   await getItem();
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
    await getItem();
  }

Future<void> createCustomMarker() async {
  customIcon = await BitmapDescriptor.fromAssetImage(
   const ImageConfiguration(size: Size(22, 22)), // Kích thước biểu tượng
    'assets/images/logo.png', // Đường dẫn đến tệp hình ảnh biểu tượng tùy chỉnh
  );
}
Future<Uint8List> getBytesFromAsset() async {
  ByteData data = await rootBundle.load('assets/images/mecical-check.png');
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

  Future<void> getItem() async {
  final Uint8List markerIcon = await getBytesFromAsset();

        listMarker.add(Marker(
          infoWindow: InfoWindow(title: 'Chi nhánh A'),
          markerId: MarkerId('1212'),
          icon:  BitmapDescriptor.fromBytes(markerIcon),
          position:
             const LatLng(10.845162970225958, 106.80953524310725),
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
                                  ImageAssets.logo
                                  ,
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
                                title: Text('Chi nhánh Nguyễn Văn A',
                                    style: TextStyle(
                                        fontSize: UtilsReponsive.height(
                                            16, Get.context!))),
                                subtitle:
                                    Text('Cách khoảng 12km'),
                              )),
                          Expanded(
                              child: SizedBox())
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                           
                          },
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
                            "Xem chi tiết",
                            style: TextStyle(
                                fontSize:
                                    UtilsReponsive.height(16, Get.context!)),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                barrierColor: Colors.transparent);
          },
        ));
      }
    }
  
