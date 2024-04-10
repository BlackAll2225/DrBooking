import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';
import 'package:drbooking/app/model/profile/request_body_create_patient.dart';

class ProfileLocal implements ProfileApi{
  @override
  Future<List<Profile>> getProfiles({required String idAccount}) async{
   await Future.delayed(Duration(seconds: 1));
   
   return [];
  }
  

  
  @override
  Future<Profile> getProfileDetailById({required String idPatient}) {
    // TODO: implement getProfileDetailById
    throw UnimplementedError();
  }
  
  @override
  Future<bool> updateProfile({required idPatient}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<bool> createNewProfile({required BodyRequestCreatePatient bodyRequest}) {
    // TODO: implement createNewProfile
    throw UnimplementedError();
  }

}