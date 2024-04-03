import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/resources/base_link.dart';

class ProfileRemote implements ProfileApi{
  ApiService apiService = ApiService();
  @override
  Future<List<Profile>> getProfiles({required String idAccount}) async{
    List<Profile> listProfiles = await apiService.fetchDataListWithPost(BaseLink.getClientsByIdAccount, (p0) => Profile.fromJson(p0), body: idAccount);
    return listProfiles;
  }
  
  @override
  Future<bool> createNewProfile({required idPatient}) {
    BaseLink.newPatient;
    // TODO: implement createNewProfile
    throw UnimplementedError();
  }
  
  @override
  Future<Profile> getProfileDetailById({required String idPatient}) async{
    // TODO: implement getProfileDetailById
    Profile profile = await apiService.fetchDataObjectWithPost(BaseLink.getProfilesById, (p0) => Profile.fromJson(p0), body: idPatient);
        return profile;
  }
  
  @override
  Future<bool> updateProfile({required idPatient}) {
    BaseLink.updatePatient;
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}