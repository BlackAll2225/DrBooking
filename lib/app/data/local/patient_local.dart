import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_payload.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_update_payload.dart';
import 'package:drbooking/app/model/patient/patient.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/patient/request_body_create_patient.dart';

class PatientLocal implements PatientApi{
  @override
  Future<Patient> createPatient({required PatientPayload payload}) {
    // TODO: implement createPatient
    throw UnimplementedError();
  }

  @override
  Future<Patient> getPatientById({required String idPatient}) {
    // TODO: implement getPatientById
    throw UnimplementedError();
  }

  @override
  Future<List<PatientPreview>> getPatients({required String searchName, required int take, required int skip}) {
    // TODO: implement getPatients
    throw UnimplementedError();
  }

  @override
  Future<Patient> updatePatient({required PatientUpdatePayload payload}) {
    // TODO: implement updatePatient
    throw UnimplementedError();
  }

  @override
  Future<Patient> updatePatientImage({required String urlImage, required String idPaient}) {
    // TODO: implement updatePatientImage
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deletePatient({required String patienttId}) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }
 

}