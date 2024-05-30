import 'dart:convert';
import 'dart:developer';
import 'package:drbooking/app/base/api_handler.dart';
import 'package:http/http.dart' as http;
import 'package:drbooking/app/base/base_common.dart';

class ApiService {
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }

  Future<List<T>> fetchDataList<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');

    final List<dynamic> data = json.decode(response.body)["data"];
    return data.map<T>((item) => fromJson(item)).toList();
  }

  Future<T> fetchDataObject<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest());
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');
    final data = json.decode(response.body)["data"];
    return fromJson(data);
  }

  Future<List<T>> fetchDataListWithPost<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson,
      {required Object body}) async {
    log(jsonEncode(body));
    final response = await http.post(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');

    if (json.decode(response.body)['status'] == 'Status200OK') {
      final List<dynamic> data = json.decode(response.body)["data"];
      return data.map<T>((item) => fromJson(item)).toList();
    } else
      throw Exception('Failed to load data');
  }

  Future<T> fetchDataObjectWithPost<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson,
      {required Object body}) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log("payload: ${body.toString()}");
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');
    if (json.decode(response.body)['status'] == 'Status200OK') {
      final data = json.decode(response.body)["data"];
      return fromJson(data);
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<T> fetchDataObjectWithPut<T>(
      String apiUrl, T Function(Map<String, dynamic>) fromJson,
      {required Object body}) async {
    final response = await http.put(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log("payload: ${body.toString()}");
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');
    if (json.decode(response.body)['status'] == 'Status200OK') {
      final data = json.decode(response.body)["data"];
      return fromJson(data);
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<bool> validationWithPost(String apiUrl, {required Object body}) async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');
    if (json.decode(response.body)['status'] == 'Status200OK') {
      return true;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<bool> validationWithPut(String apiUrl, {required Object body}) async {
    final response = await http.put(Uri.parse(apiUrl),
        headers: BaseCommon.instance.headerRequest(), body: jsonEncode(body));
    log('StatusCode ${response.statusCode} - $apiUrl');
    log('Body ${response.body}');
    log("id $body");
    if (json.decode(response.body)['status'] == 'Status200OK') {
      return true;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}
