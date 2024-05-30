import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/feedback.dart';

class DoctorLocal implements DoctorApi {
  @override
  Future<List<DoctorPreview>> getListDoctorRandom({required String? param}) async {
    await Future.delayed(Duration(seconds: 1));
    // List<DoctorPreview> listDoctor = [
    //   DoctorPreview(
    //       id: "1",
    //       name: "Nguyễn Thị Na",
    //       branch: "Chi nhánh Lê Văn Việt",
    //       special: "Khoa tim mạch",
    //       exp: 1.5,
    //       rate: 4,
    //       countReview: 100),
    //   DoctorPreview(
    //       id: "2",
    //       name: "Nguyễn Văn C",
    //       branch: "Chi nhánh Lê Văn Việt",
    //       special: "Khoa tâm lý học",
    //       exp: 2,
    //       rate: 4,
    //       countReview: 120),
    //   DoctorPreview(
    //       id: "3",
    //       name: "Trần Hạo Nam",
    //       branch: "Chi nhánh Lê Văn Việt",
    //       special: "Khoa gan",
    //       exp: 4,
    //       rate: 5,
    //       countReview: 130),
    //   DoctorPreview(
    //       id: "4",
    //       name: "Nguyễn Thị Na",
    //       branch: "Chi nhánh Lê Văn Việt",
    //       special: "Khoa nội tim mạch",
    //       exp: 15,
    //       rate: 3,
    //       countReview: 140)
    // ];
    return [];
  }

  @override
  Future<List<Clinic>> getListClinic({required String param}) async {
    await Future.delayed(Duration(seconds: 1));
    List<Clinic> listClinic = [
      Clinic(
          name: "name",
          addressLine: "addressLine",
          street: "street",
          ward: "ward",
          district: "district",
          province: "province",
          id: "id",
          isActive: true,
          createdAt: DateTime.now(),
          fullAddress: "fullAddress",
          phoneNumber: "phoneNumber")
    ];
    return listClinic;
  }

  @override
  Future<Doctor> getDoctorDetailById({required String id}) {
    // TODO: implement getDoctorDetailById
    throw UnimplementedError();
  }

  @override
  Future<Object> getSpecialsByIdClinic({required String idClinic}) {
    // TODO: implement getSpecialsByIdClinic
    throw UnimplementedError();
  }


  @override
  Future<List<MedicalService>> getListMedicalServiceExamination() {
    // TODO: implement getListMedicalServiceLab
    throw UnimplementedError();
  }

  @override
  Future<List<MedicalService>> getListMedicalServicePyschological() {
    // TODO: implement getListMedicalServicePys
    throw UnimplementedError();
  }

  @override
  Future<List<MedicalService>> getListMedicalServiceVacination() {
    // TODO: implement getListMedicalServiceVacin
    throw UnimplementedError();
  }
  
  @override
  Future<List<Specialty>> getListSpecialtyByIdClinic({required String idClinic, required String searchName}) {
    // TODO: implement getListSpecialtyByIdClinic
    throw UnimplementedError();
  }
  
  @override
  Future<List<DoctorPreview>> getListDoctorBySpecialAndClinic({required String idClinic, required String idSpecialty}) {
    // TODO: implement getListDoctorBySpecialAndClinic
    throw UnimplementedError();
  }

  @override
  Future<List<Feedback>> getFeedbackByIdDoctor({required String idDoctor}) {
    // TODO: implement getFeedbackByIdDoctor
    throw UnimplementedError();
  }
}
