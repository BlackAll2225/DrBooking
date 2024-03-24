import 'package:drbooking/app/model/profile.dart';

abstract class ProfileApi {
  Future<List<Profile>> getProfiles({required String idAccount});
}