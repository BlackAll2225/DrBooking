import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/data/respository/auth_api.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;

class AuthRemote implements AuthApi {
  ApiService apiService = ApiService();
  @override
  Future<String> login(
      {required String phone, required String password}) async {
    final response = await http.post(Uri.parse(BaseLink.login),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"phoneNumber": phone, "password": password}));
        log((response.body));
         final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      log("message");
      final data = body['data'];
      return data;
    } else {
      throw Exception(body['message']);
    }
  }
  
  @override
  Future<bool> register({required String phone, required String password, required String fullName}) async{
   final response = await http.post(Uri.parse(BaseLink.register),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
            "phoneNumber": phone,
            "password": password,
            "fullName": fullName
          }));
    log(response.body);
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      return true;
    } 
    throw Exception( throw Exception(body['message']));
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
  Future<PersonalAccount> getPersonal({required String idClient}) async{
      PersonalAccount data = await apiService.fetchDataObjectWithPost(BaseLink.getInformation, (p0) => PersonalAccount.fromJson(p0), body: jsonEncode(idClient));
      return data;
  }
}
