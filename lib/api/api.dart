import 'dart:convert';
import 'dart:developer';

import 'package:api_task/utils/appconstants.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';



Future<Map<String, String>> headers() async {
  final Map<String, String> headers = <String, String>{};
  headers["Content-Type"] = "application/json";
  headers["User-Agent"] = "livefootballscore";
  headers["Deviceid"] = "95be88d7-3907-467b-81e5-1e74f8c409e5";
  headers["Ts"] = "1713934795021";
  headers["Signature"] = "QyEA01cGVLyzMpncNRqiH++m8Tf/ivtHwlbLrPGdXx/o7TsgU4ZGoFR4JvZYZ6M4a3zFyw5RM/ES64ZABweN8uXZxK8=";
  return headers;
}

class Api {
  static Api? _instance;

  static http.Client get dio => InterceptedClient.build(
    interceptors: [
      // LoggerInterceptor(),
    ],
  );

  factory Api() {
    if (_instance == null) {
      _instance = Api._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Api._();

  Future<http.Response> post(
      String url, {
        Map<String, dynamic>? queryData,
        Map<String, dynamic>? bodyData,
      }) async {
    log("post ${await headers()}}");
    final response = await dio.post(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> put(
      String url, {
        Map<String, dynamic>? queryData,
        Map<String, dynamic>? bodyData,
      }) async {
    log("put ${await headers()}}");
    final response = await dio.put(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> patch(
      String url, {
        Map<String, dynamic>? queryData,
        Map<String, dynamic>? bodyData,
      }) async {
    final response = await dio.patch(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> delete(
      String url, {
        Map<String, dynamic>? queryData,
        Map<String, dynamic>? bodyData,
      }) async {
    final response = await dio.delete(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> head(
      String url, {
        Map<String, dynamic>? queryData,
      }) async {
    final response = await dio.head(
      getUrl(url, queryParameters: queryData),
      headers: await headers(),
    );
    return response;
  }

  Future<http.Response> get(
      String url, {
        Map<String, dynamic>? queryData,
      }) async {
    log("get ${await headers()}}");
    final response = await dio.get(
      getUrl(url, queryParameters: queryData),
      headers: await headers(),
    );
    return response;
  }
}

Uri getUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
  String url = "${AppConstans.BASE_URL}$endpoint";
  if (queryParameters != null && queryParameters.isNotEmpty) {
    url = "$url?";
    for (int i = 0; i < queryParameters.entries.length; i++) {
      final element = queryParameters.entries.elementAt(i);
      url += '${element.key}=${element.value}';
      if (i < queryParameters.entries.length - 1) {
        url += '&';
      }
    }
  }
  log(Uri.parse(url).toString());
  return Uri.parse(url);
}

Uri parseUrl(String url) {
  log(Uri.parse(url).toString());
  return Uri.parse(url);
}
