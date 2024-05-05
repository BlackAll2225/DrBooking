import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_payload.dart';
import 'package:drbooking/app/model/patient/patient.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/patient/request_body_create_patient.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;

class PatientRemote implements PatientApi {
  ApiService apiService = ApiService();

  @override
  Future<Patient> createPatient({required PatientPayload payload}) async {
    Map<String, dynamic> body = {};
    payload.toJson().forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        body[key] = value;
      }
    });
    Patient patient = await apiService.fetchDataObjectWithPost(
        BaseLink.createPatient, (p0) => Patient.fromJson(p0),
        body: body);
    return patient;
  }

  @override
  Future<Patient> getPatientById({required String idPatient}) {
    // TODO: implement getPatientById
    throw UnimplementedError();
  }

  @override
  Future<List<PatientPreview>> getPatients(
      {required String searchName,
      required int take,
      required int skip}) async {
    String url = '${BaseLink.getPatients}take=$take&&skip$skip/$searchName';
    List<PatientPreview> list = await apiService.fetchDataList(
        url, (p0) => PatientPreview.fromJson(p0));
    return list;
  }

  @override
  Future<Patient> updatePatient({required PatientPayload payload}) {
    // TODO: implement updatePatient
    throw UnimplementedError();
  }

  @override
  Future<Patient> updatePatientImage(
      {required String urlImage, required String idPaient}) {
    // TODO: implement updatePatientImage
    throw UnimplementedError();
  }
}
