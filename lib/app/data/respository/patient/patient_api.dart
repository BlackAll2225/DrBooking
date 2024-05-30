import 'package:drbooking/app/data/respository/patient/request_payload/patient_payload.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_update_payload.dart';
import 'package:drbooking/app/model/patient/patient.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/patient/request_body_create_patient.dart';

abstract class PatientApi {
  Future<List<PatientPreview>> getPatients({required String searchName, required int take, required int skip});
  Future<Patient> getPatientById({required String idPatient});
  Future<Patient> createPatient({required PatientPayload payload});
  Future<Patient> updatePatient({required PatientUpdatePayload payload});
  Future<Patient> updatePatientImage({required String urlImage, required String idPaient});
}