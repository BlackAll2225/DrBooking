import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/profile/request_body_create_patient.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;

class ProfileRemote implements ProfileApi {
  ApiService apiService = ApiService();
  @override
  Future<List<Profile>> getProfiles({required String idAccount}) async {
    List<Profile> listProfiles = await apiService.fetchDataListWithPost(
        BaseLink.getClientsByIdAccount, (p0) => Profile.fromJson(p0),
        body: idAccount);
    return listProfiles;
  }

  @override
  Future<bool> createNewProfile(
      {required BodyRequestCreatePatient bodyRequest}) async {
    Map<String, dynamic> body = {};
    bodyRequest.toJson().forEach((key, value) {
      if (value != null) {
        body[key] = value;
      }
    });
    log(jsonEncode(body));
    final response = await http.post(Uri.parse(BaseLink.createPatient),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log('StatusCode ${response.statusCode} - ${BaseLink.createPatient}');
    log('Body ${response.body}');
    if (json.decode(response.body)["status"] == 'Status200OK') {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<Profile> getProfileDetailById({required String idPatient}) async {
    // TODO: implement getProfileDetailById
    log(idPatient);
    Profile profile = await apiService.fetchDataObjectWithPost(
        BaseLink.getPatientById, (p0) => Profile.fromJson(p0),
        body: idPatient);
    return profile;
  }

  @override
  Future<bool> updateProfile({required idPatient}) {
    BaseLink.updatePatient;
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
