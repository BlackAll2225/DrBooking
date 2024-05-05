import 'dart:convert';
import 'dart:developer';

import 'package:drbooking/app/model/address/district.dart';
import 'package:drbooking/app/model/address/province.dart';
import 'package:drbooking/app/model/address/ward.dart';
import 'package:drbooking/app/resources/base_link.dart';
import 'package:http/http.dart' as http;

class AddressApi {
  static Future<List<T>> fetchDataList<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Token': '85c2d745-f50a-11ee-a6e6-e60958111f48'
    });
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');

    final List<dynamic> data = json.decode(response.body)["data"];
    return data.map<T>((item) => fromJson(item)).toList();
  }

  static Future<List<T>> fetchDataListWithPost<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson,
      {required Object body}) async {
    log(jsonEncode(body));
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Token': '85c2d745-f50a-11ee-a6e6-e60958111f48'
        },
        body: jsonEncode(body));
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["data"];
      return data.map<T>((item) => fromJson(item)).toList();
    } else
      throw Exception('Failed to load data');
  }

  static Future<List<Province>> getProvince() async {
    List<Province> listProvince = await fetchDataList(
        BaseLink.getProvinces, (p0) => Province.fromJson(p0));
    return listProvince;
  }

  static Future<List<District>> getDistrictByIdProvince(
      {required int idProvince}) async {
    List<District> listDistrict = await fetchDataListWithPost(
        BaseLink.getDistrict, (p0) => District.fromJson(p0),
        body: {'province_id': idProvince});
    return listDistrict;
  }

  static Future<List<Ward>> getWardByIdDistrict({required int idDistrict}) async {
    List<Ward> listWard =
        await fetchDataList(BaseLink.getWard + '$idDistrict', (p0) => Ward.fromJson(p0));
    return listWard;
  }
}
