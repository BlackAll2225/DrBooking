import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/branch.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/model/feedback.dart';

abstract class DoctorApi {
  Future<List<DoctorPreview>> getListDoctorRandom({required String? param});
  Future<List<Clinic>> getListClinic({required String param});
  Future<Doctor> getDoctorDetailById({required String id});

  Future<List<DoctorPreview>> getListDoctorBySpecialAndClinic({required String idClinic, required String idSpecialty});
  Future<List<Specialty>> getListSpecialtyByIdClinic({required String idClinic, required String searchName});

  Future<List<MedicalService>> getListMedicalServiceExamination();
  Future<List<MedicalService>> getListMedicalServiceVacination();
  Future<List<MedicalService>> getListMedicalServicePyschological();
  Future<List<Feedback>> getFeedbackByIdDoctor({required String idDoctor});


}