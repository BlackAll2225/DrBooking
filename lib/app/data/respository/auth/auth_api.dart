
import 'package:drbooking/app/data/respository/auth/request_payload/confirm_otp_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/login_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/register_payload.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';

abstract class AuthApi {
  //1
  Future<String> login({required LoginPayload payload});
  //2
  Future<bool> register({required RegisterPayload payload});
  //3
  Future<String> refreshToken({required String deviceToken});
  //4
  Future<bool> sendEmailOTP({required String email});
  //5
  Future<String> confirmOTP({required ConfirmOtpPayload payload});
  //6
  Future<PersonalAccount> getClientProfile();
  //7
  Future<PersonalAccount> updateClientProfile({required String idClient});
  //8
  Future<String> updateAvatarClientProfile({required String stringPathImage});
  //9
  Future<bool> changePassword({required String currentPassword, required String newPassword});

  Future<String> changePassForgot({required String otp, required String email, required String password});

  Future<String> updateNameAccount({required String name});
}