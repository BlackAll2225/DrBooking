import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/base/base_controller.dart';
import 'package:drbooking/app/data/local/booking_local.dart';
import 'package:drbooking/app/data/remote/booking_remote.dart';
import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';
import 'package:get/get.dart';

class TabCalendarController extends BaseController {
  //TODO: Implement TabCalendarController

  final count = 0.obs;
  final isHistory = false.obs;
  late BookingApi bookingApi;
  RxList<BookingPreview> listBookingPreview = <BookingPreview>[].obs;
  @override
  Future<void> onInit() async {
    bookingApi = BaseCommon.instance.mode == LOCAL_MODE
        ? BookingLocal()
        : BookingRemote();
    await fetchListBooking();

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

  void increment() => count.value++;

  swapStatus({required bool isHistory}) async {
    this.isHistory.value = isHistory;
    await fetchListBooking();
  }

  fetchListBooking() async {
    try {
      isLoading.value = true;
      listBookingPreview.value = await bookingApi.getListBookingNewest();
      isLoading.value = false;
    } catch (e) {}
  }

  fetchListPending() {}
}
