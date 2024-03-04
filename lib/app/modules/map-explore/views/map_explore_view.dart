import 'dart:developer';

import 'package:drbooking/app/base/base_view.dart';
import 'package:drbooking/app/modules/map-explore/views/search_map_view.dart';
import 'package:drbooking/app/resources/color_manager.dart';
import 'package:drbooking/app/resources/reponsive_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../controllers/map_explore_controller.dart';

class MapExploreView extends BaseView<MapExploreController> {
  const MapExploreView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    log(controller.listMarker.length.toString());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.primary,
                      ),
                    )
                  : GoogleMap(
                      markers: Set.from(controller.listMarker.value),
                      myLocationEnabled: true,
                      onMapCreated: controller.onMapCreated,
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                          zoom: 16,
                          target:
                              LatLng(10.845162970225958, 106.80953524310725))),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: UtilsReponsive.height(
                  120,
                  context,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: UtilsReponsive.width(20, context),
                          ),
                          Text(
                            'Map',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize:
                                    UtilsReponsive.formatFontSize(18, context),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: UtilsReponsive.height(5, context),
                          horizontal: UtilsReponsive.width(
                            20,
                            context,
                          )),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(SearchAddressPage());
                        },
                        child: Container(
                          padding:
                              EdgeInsetsDirectional.all(UtilsReponsive.width(
                            15,
                            context,
                          )),
                          height: UtilsReponsive.height(
                            20,
                            context,
                          ),
                          width: double.infinity,
                          child: Obx(() => Text(
                                '${controller.textSearch.value.isEmpty ? "Tìm kiếm" : controller.textSearch.value}',
                                overflow: TextOverflow.ellipsis,
                              )),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Positioned(
              top: UtilsReponsive.height(140, context),
              right: UtilsReponsive.height(20, context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_on, color: Colors.black)),
                  ),
                  SizedBox(
                    height: UtilsReponsive.height(10, context),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
