import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/data/respository/patient/patient_api.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_payload.dart';
import 'package:drbooking/app/data/respository/patient/request_payload/patient_update_payload.dart';
import 'package:drbooking/app/model/patient/patient.dart';
import 'package:drbooking/app/model/patient/patient_preview.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/patient/request_body_create_patient.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

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
  Future<Patient> getPatientById({required String idPatient}) async {
    Patient patiet = await apiService.fetchDataObject(
        BaseLink.getPatientById + 'patientProfileId=$idPatient',
        (p0) => Patient.fromJson(p0));
    return patiet;
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
  Future<Patient> updatePatient({required PatientUpdatePayload payload}) async {
    Map<String, dynamic> body = {};
    payload.toJson().forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        body[key] = value;
      }
    });
    Patient patient = await apiService.fetchDataObjectWithPut(
        BaseLink.updatePatient, (p0) => Patient.fromJson(p0),
        body: body);
    return patient;
  }

  @override
  Future<Patient> updatePatientImage(
      {required String urlImage, required String idPaient}) async {
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${BaseCommon.instance.accessToken}',
      'Content-Type': 'multipart/form-data',
    };
    // if (stringPathImage.isNotEmpty) {
    final multiPartFile = await dio.MultipartFile.fromFile(
      urlImage,
      contentType: MediaType("image", path.extension(urlImage)),
    );

    // formData.files.add(MapEntry('image', multiPartFile));
    // }
    var formData = dio.FormData.fromMap({'file': multiPartFile});
    var response = await dioRequest.put(
      BaseLink.updatePatientImage + 'id=$idPaient',
      data: formData,
    );
    log('updatePatientImage - status code : ${response.statusCode}');
    log('updatePatientImage - body code : ');
    final body = response.data;
    if (body["status"] == "Status200OK") {
      return Patient.fromJson(body["data"]);
    }
    throw Exception(throw Exception(body['message']));
  }

  @override
  Future<bool> deletePatient({required String patienttId}) async {
    final response = await http.delete(
      Uri.parse(BaseLink.deletePatient + patienttId),
      headers: BaseCommon.instance.headerRequest(),
    );
      log(json.decode(response.body).toString());
    if (json.decode(response.body)['status'] == 'Status200OK') {
      return true;
    } else{
      throw Exception(throw Exception(json.decode(response.body)['message']));
    }
  }
}
