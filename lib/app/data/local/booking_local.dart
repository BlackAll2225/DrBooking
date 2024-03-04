import 'package:drbooking/app/data/respository/booking_api.dart';
import 'package:drbooking/app/model/booking/booking_preview.dart';

class BookingLocal implements BookingApi{
  @override
  Future<BookingPreview> getBookingDetail() async {
    throw Exception();
    //   await Future.delayed(Duration(seconds: 1));
    // return null;
  }

  @override
  Future<List<BookingPreview>> getListBookingNewest() async{
      await Future.delayed(Duration(seconds: 1));
      List<BookingPreview> listBookingPreview = [
        BookingPreview( time: '9:00 - 11:00', date: '2024-03-12', name: 'Nguyễn Văn A', branch: 'Chi nhánh Nguyễn Văn Trỗi', isNew: true),
        BookingPreview( time: '14:00 - 16:00', date: '2024-03-15', name: 'Nguyễn Văn B', branch: 'Chi nhánh Lê Văn Việt', isNew: false),
      ];
      return listBookingPreview;
  }
}