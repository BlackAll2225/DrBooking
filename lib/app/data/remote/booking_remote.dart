import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';

class BookingRemote implements BookingApi{
  @override
  Future<BookingPreview> getBookingDetail() {
    // TODO: implement getBookingDetail
    throw UnimplementedError();
  }

  @override
  Future<List<BookingPreview>> getListBookingNewest() {
    // TODO: implement getListBookingNewest
    throw UnimplementedError();
  }
}