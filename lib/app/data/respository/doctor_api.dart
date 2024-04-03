import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/branch.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';

abstract class DoctorApi {
  Future<List<Doctor>> getListDoctorRandom({required String param});
  Future<List<Clinic>> getListClinic({required String param});
  Future<Doctor> getDoctorDetailById({required String id});

  Future<List<Specialty>> getListSpecialtyByIdClinic({required String idClinic});

  Future<List<MedicalService>> getListMedicalServiceLab();
  Future<List<MedicalService>> getListMedicalServiceVacin();
  Future<List<MedicalService>> getListMedicalServicePys();

}