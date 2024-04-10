import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/profile/request_body_create_patient.dart';

abstract class ProfileApi {
  Future<List<Profile>> getProfiles({required String idAccount});
  Future<Profile> getProfileDetailById({required String idPatient});
  Future<bool> createNewProfile({required BodyRequestCreatePatient bodyRequest});
  Future<bool> updateProfile({required dynamic idPatient});
}