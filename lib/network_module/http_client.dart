import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'api_base.dart';
import 'api_exceptions.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    var responseJson;

    var uri = url + ((params != null) ? this.queryParameters(params) : "");
    String? token=prefs.getString("Token");
    Map<String, String> header= {
      "Accept": "application/json",
      "Accept-Language":"en",
      "User-Agent": Platform.isAndroid?"android":"iOS",
      "X-Install-Type": "telehealer-india",
      "Content-Type":"application/json; charset=UTF-8",
      "Host":"44.238.77.66:8082",
      "X-Access-Token":token??""
    };

    try {
      final response = await http.get(Uri.parse(uri), headers: header);
      //print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {

    Map<String, String> header= {
      "Accept": "application/json",
      "Accept-Language":"en",
      "User-Agent": Platform.isAndroid?"android":"iOS",
      "X-Install-Type": "telehealer-india",
      "Content-Type":"application/json; charset=UTF-8",
      "Host":"44.238.77.66:8082",
      "Content-Length":body.length.toString()
    };

// Setting the content-length header here
    //request.headers.set('Content-Length', body.length.toString());

    var responseJson;
    try {
      final response =
          await http.post(Uri.parse(url),headers: header,body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
