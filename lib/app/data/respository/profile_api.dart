import 'package:drbooking/app/model/profile.dart';

abstract class ProfileApi {
  Future<List<Profile>> getProfiles({required String idAccount});
  Future<Profile> getProfileDetailById({required String idPatient});
  Future<bool> createNewProfile({required dynamic idPatient});
  Future<bool> updateProfile({required dynamic idPatient});
}