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

}