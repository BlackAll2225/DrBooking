import 'package:drbooking/app/model/booking/booking_preview.dart';

abstract class BookingApi {
  Future<List<BookingPreview>> getListBookingNewest();
  Future<BookingPreview> getBookingDetail();
}