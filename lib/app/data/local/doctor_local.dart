import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';

class DoctorLocal implements DoctorApi {
  @override
  Future<List<DoctorPreview>> getListDoctorRandom() async {
   await Future.delayed(Duration(seconds: 1));
    List<DoctorPreview> listDoctor = [
      DoctorPreview(id: "1", name: "Nguyễn Thị Na",branch: "Chi nhánh Lê Văn Việt", special: "Khoa tim mạch", exp: 1.5, rate: 4, countReview: 100)
      ,DoctorPreview(id: "2", name: "Nguyễn Văn C",branch: "Chi nhánh Lê Văn Việt", special: "Khoa tâm lý học", exp: 2, rate: 4, countReview: 120)
      ,DoctorPreview(id: "3", name: "Trần Hạo Nam",branch: "Chi nhánh Lê Văn Việt", special: "Khoa gan", exp: 4, rate: 5, countReview: 130)
      ,DoctorPreview(id: "4", name: "Nguyễn Thị Na", branch: "Chi nhánh Lê Văn Việt",special: "Khoa nội tim mạch", exp: 15, rate: 3, countReview: 140)
    ];
    return listDoctor;
  }
}
