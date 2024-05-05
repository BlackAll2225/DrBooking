
import 'dart:convert';
import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:drbooking/app/model/address/district.dart';
import 'package:drbooking/app/model/auth/account_session.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

const REMOTE_MODE = "REMOTE";
const LOCAL_MODE = "LOCAL";

class BaseCommon {
  static BaseCommon? _instance;
  String? accessToken;
  String? refreshToken;
  String? mode;
  AccountSession? accountSession;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken;

  BaseCommon._internal();

  static BaseCommon get instance {
    _instance ??= BaseCommon._internal();
    return _instance!;
  }

  Map<String, String> headerRequest() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'bearer $accessToken'
    };
  }

  Future<void> saveToken(String jwt) async {
    accessToken = jwt;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', jwt);
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = '';
    refreshToken = ''; 
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  Future<void> init({required String mode}) async {
    this.mode = mode;
    final SharedPreferences prefs = await SharedPreferences.getInstance(); 
    accessToken = prefs.getString('accessToken') ?? '';
    refreshToken = prefs.getString('refreshToken') ?? '';
    firebaseMessaging.requestPermission();
    deviceToken = await firebaseMessaging.getToken();
  }

  decodeJWT() async {
    final jwt = JWT.decode(accessToken!);
    log(jsonEncode(jwt.payload));
    AccountSession dataSession = AccountSession.fromJson(jwt.payload);
    accountSession = dataSession;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountSession', jsonEncode(dataSession));  
  }

  

}
