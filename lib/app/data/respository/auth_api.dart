
import 'package:drbooking/app/model/auth/personal_account.dart';

abstract class AuthApi {
  Future<String> login({required String phone, required String password});
  Future<bool> register({required String phone, required String password, required String fullName});
  Future<String> sendEmailOTP({required String email});
  Future<String> confirmOTP({required String email, required String verifyCode});
  Future<String> changePassword({required String email, required String verifyCode});
  Future<PersonalAccount> getPersonal({required String idClient});

}