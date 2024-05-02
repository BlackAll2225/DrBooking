import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/data/respository/doctor_api.dart';
import 'package:drbooking/app/model/booking/medical_service.dart';
import 'package:drbooking/app/model/clinic.dart';
import 'package:drbooking/app/model/doctor/doctor.dart';
import 'package:drbooking/app/model/doctor/doctor_preview.dart';
import 'package:drbooking/app/model/doctor/specicalty.dart';
import 'package:drbooking/app/resources/base_link.dart';

class DoctorRemote implements DoctorApi {
  ApiService apiBase = ApiService();
  @override
  Future<List<Doctor>> getListDoctorRandom({required String param}) async{
     List<Doctor> listDoctor = await apiBase.fetchDataList(BaseLink.getDoctorsByClinic + param, (json) => Doctor.fromJson(json));
    return listDoctor;
  }

  @override
  Future<List<Clinic>> getListClinic({required String param}) async{
    List<Clinic> listClinic = await apiBase.fetchDataList(BaseLink.getClinic + param, (json) => Clinic.fromJson(json));
    return listClinic;
  }
  
  @override
  Future<Doctor> getDoctorDetailById({required String id}) async{
    Doctor doctor = await apiBase.fetchDataObject(BaseLink.getDoctorById + id, (json) => Doctor.fromJson(json));
    return doctor;
  }

  @override
  Future<List<Specialty>> getListSpecialtyByIdClinic({required String idClinic, required String searchName}) async{
   List<Specialty> listSpecialty = await apiBase.fetchDataList(BaseLink.getSpecials + idClinic+'/$searchName', (json) => Specialty.fromJson(json));
   return listSpecialty;
  }
  
  @override
  Future<List<MedicalService>> getListMedicalServiceExamination() async{
   List<MedicalService> listService = await apiBase.fetchDataList(BaseLink.getExaminationService, (p0) => MedicalService.fromJson(p0), );
   return listService;
  }
  
  @override
   Future<List<MedicalService>> getListMedicalServicePyschological()async{
    List<MedicalService> listService = await apiBase.fetchDataList(BaseLink.getPsychologicalService, (p0) => MedicalService.fromJson(p0), );
   return listService;
  }
  
  @override
   Future<List<MedicalService>> getListMedicalServiceVacination()async {
   List<MedicalService> listService = await apiBase.fetchDataList(BaseLink.getVaccinationService, (p0) => MedicalService.fromJson(p0), );
   return listService;
  }
  


  
}