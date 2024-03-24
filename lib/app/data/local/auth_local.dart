import 'package:drbooking/app/data/respository/auth_api.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';

class AuthLocal implements AuthApi{
  @override
  Future<String> login({required String phone, required String password}) async{
    // TODO: implement login
   return "jwt";
  }
  
  @override
  Future<bool> register({required String phone, required String password, required String fullName}) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
  @override
  Future<String> confirmOTP({required String email, required String verifyCode}) {
    // TODO: implement confirmOTP
    throw UnimplementedError();
  }
  
  @override
  Future<String> sendEmailOTP({required String email}) {
    // TODO: implement sendEmailOTP
    throw UnimplementedError();
  }
  
  @override
  Future<String> changePassword({required String email, required String verifyCode}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
  
  @override
  Future<PersonalAccount> getPersonal({required String idClient}) {
    // TODO: implement getPersonal
    throw UnimplementedError();
  }
  
}