import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/base/base_api_service.dart';
import 'package:drbooking/app/base/base_common.dart';
import 'package:drbooking/app/data/respository/auth/auth_api.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/confirm_otp_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/login_payload.dart';
import 'package:drbooking/app/data/respository/auth/request_payload/register_payload.dart';
import 'package:drbooking/app/model/auth/personal_account.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class AuthRemote implements AuthApi {
  ApiService apiService = ApiService();

  // @override
  // Future<String> login(
  //     {required String phone, required String password}) async {
  //   final response = await http.post(Uri.parse(BaseLink.login),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Accept': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode({"phoneNumber": phone, "password": password}));
  //       log((response.body));
  //        final body = json.decode(response.body);
  //   if (body["status"] == "Status200OK") {
  //     log("message");
  //     final data = body['data'];
  //     return data;
  //   } else {
  //     throw Exception(body['message']);
  //   }
  // }

  // @override
  // Future<bool> register({required String phone, required String password, required String fullName}) async{
  //  final response = await http.post(Uri.parse(BaseLink.register),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Accept': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode({
  //           "phoneNumber": phone,
  //           "password": password,
  //           "fullName": fullName
  //         }));
  //   log(response.body);
  //   final body = json.decode(response.body);
  //   if (body["status"] == "Status200OK") {
  //     return true;
  //   }
  //   throw Exception( throw Exception(body['message']));
  // }
  @override
  Future<bool> changePassword(
      {required String currentPassword, required String newPassword}) async {
    final response = await http.put(Uri.parse(BaseLink.changePassword),
        headers: BaseCommon.instance.headerRequest(),
        body: jsonEncode(
            {"currentPassword": currentPassword, "newPassword": newPassword}));
    log(response.body);
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      return true;
    }
    throw Exception(throw Exception(body['message']));
  }

  @override
  Future<String> confirmOTP({required ConfirmOtpPayload payload}) async {
    final response = await http.post(Uri.parse(BaseLink.confirmOTP),
        headers: BaseCommon.instance.headerRequest(),
        body: jsonEncode(payload.toJson()));
    log((response.body));
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      final data = body['data'];
      return data;
    } else {
      throw Exception(body['message']);
    }
  }

  @override
  Future<PersonalAccount> getClientProfile() {
    // TODO: implement getClientProfile
    throw UnimplementedError();
  }

  @override
  Future<String> login({required LoginPayload payload}) async {
    final response = await http.post(Uri.parse(BaseLink.login),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload.toJson()));
    log((response.body));
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      final data = body['data'];
      return data;
    } else {
      throw Exception(body['message']);
    }
  }

  @override
  Future<String> refreshToken({required String deviceToken}) async {
    final response = await http.post(Uri.parse(BaseLink.refreshToken),
        headers: BaseCommon.instance.headerRequest(),
        body: jsonEncode(deviceToken));
    log((response.body));
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      final data = body['data'];
      return data;
    } else {
      throw Exception(body['message']);
    }
  }

  @override
  Future<bool> register({required RegisterPayload payload}) async {
    final response = await http.post(Uri.parse(BaseLink.register),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload.toJson()));
    log(response.body);
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      return true;
    }
    throw Exception(throw Exception(body['message']));
  }

  @override
  Future<bool> sendEmailOTP({required String email}) async {
    final response = await http.post(Uri.parse(BaseLink.sendOTP),
        headers: {'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',},
        body: jsonEncode(email));
    log(jsonEncode(response.body));
    final body = json.decode(response.body);
    if (body["status"] == "Status200OK") {
      return true;
    }
    throw Exception(body['message']);
  }

  @override
  Future<String> updateAvatarClientProfile(
      {required String stringPathImage}) async {
    // TODO: implement updateAvatarClientProfile
    var dioRequest = dio.Dio();
    dioRequest.options.headers = {
      'Authorization': 'Bearer ${BaseCommon.instance.accessToken}',
      'Content-Type': 'multipart/form-data',
    };
    // if (stringPathImage.isNotEmpty) {
    final multiPartFile = await dio.MultipartFile.fromFile(
      stringPathImage,
      contentType: MediaType("image", path.extension(stringPathImage)),
    );

    // formData.files.add(MapEntry('image', multiPartFile));
    // }
    var formData = dio.FormData.fromMap({'file': multiPartFile});
    var response = await dioRequest.put(
      BaseLink.updateAvatar,
      data: formData,
    );
    log('updateInformation- status code : ${response.statusCode}');
    log('updateInformation - body code : ');
    final body = response.data;
    if (body["status"] == "Status200OK") {
      return body["data"];
    }
    throw Exception(throw Exception(body['message']));
  }

  @override
  Future<PersonalAccount> updateClientProfile({required String idClient}) {
    // TODO: implement updateClientProfile
    throw UnimplementedError();
  }
}
