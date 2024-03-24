import 'package:drbooking/app/data/respository/profile_api.dart';
import 'package:drbooking/app/model/profile.dart';

class ProfileLocal implements ProfileApi{
  @override
  Future<List<Profile>> getProfiles({required String idAccount}) async{
   await Future.delayed(Duration(seconds: 1));
   
   return [];
  }

}