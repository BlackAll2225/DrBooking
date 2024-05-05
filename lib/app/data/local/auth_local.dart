import 'package:drbooking/app/data/respository/auth/auth_api.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/confirm_otp_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/login_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/register_payload.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';

class AuthLocal implements AuthApi{
  @override
  Future<bool> changePassword({required String currentPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<String> confirmOTP({required ConfirmOtpPayload payload}) {
    // TODO: implement confirmOTP
    throw UnimplementedError();
  }

  @override
  Future<PersonalAccount> getClientProfile() {
    // TODO: implement getClientProfile
    throw UnimplementedError();
  }

  @override
  Future<String> login({required LoginPayload payload}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> refreshToken({required String deviceToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> register({required RegisterPayload payload}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> sendEmailOTP() {
    // TODO: implement sendEmailOTP
    throw UnimplementedError();
  }

  @override
  Future<String> updateAvatarClientProfile({required String stringPathImage}) {
    // TODO: implement updateAvatarClientProfile
    throw UnimplementedError();
  }

  @override
  Future<PersonalAccount> updateClientProfile({required String idClient}) {
    // TODO: implement updateClientProfile
    throw UnimplementedError();
  }
 
}