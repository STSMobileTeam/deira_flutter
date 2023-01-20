// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


import '../Helper/navigatorService.dart';
import 'apiurls.dart';


class DioHelper {
  Dio dio = Dio();

  int retryAttempt = 0;

  DioHelper() {
    dio.options.baseUrl = ApiUrls.baseUrl;

    dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    _apiCalls();

    _setupDebugInterceptor();

  }

  _apiCalls() async {

    bool result = await InternetConnectionChecker().hasConnection;

    if (result){
      dio.transformer = JsonTransformer();
      dio.options.validateStatus = (int? status) {
        return status! < 400;
      };
    }else{
      showDialog(
          context: NavigationService.navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('No Internet !')),
              content: Image.asset(
                "assets/images/no internet.gif",
                height: 200,
                width: 200,
              ),
            );
          });
    }

  }

  _setupDebugInterceptor() {
    if (DebugMode.isInDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}

class DioHelper_Login {
  Dio dio = Dio();

  int retryAttempt = 0;

  DioHelper_Login() {
    dio.options.baseUrl = ApiUrls.baseUrl_Login;

    dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    _apiCalls();

    _setupDebugInterceptor();

  }

  _apiCalls() async {

    bool result = await InternetConnectionChecker().hasConnection;

    if (result){
      dio.transformer = JsonTransformer();
      dio.options.validateStatus = (int? status) {
        return status! < 400;
      };
    }else{
      showDialog(
          context: NavigationService.navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('No Internet !')),
              content: Image.asset(
                "assets/images/no internet.gif",
                height: 200,
                width: 200,
              ),
            );
          });
    }

  }

  _setupDebugInterceptor() {
    if (DebugMode.isInDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}

class DioHelper_PG {
  Dio dio = Dio();

  int retryAttempt = 0;

  DioHelper_PG() {
    dio.options.baseUrl = ApiUrls.baseurl_PG;

    dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    _apiCalls();

    _setupDebugInterceptor();

  }

  _apiCalls() async {

    bool result = await InternetConnectionChecker().hasConnection;

    if (result){
      dio.transformer = JsonTransformer();
      dio.options.validateStatus = (int? status) {
        return status! < 400;
      };
    }else{
      showDialog(
          context: NavigationService.navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('No Internet !')),
              content: Image.asset(
                "assets/images/no internet.gif",
                height: 200,
                width: 200,
              ),
            );
          });
    }

  }

  _setupDebugInterceptor() {
    if (DebugMode.isInDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}

class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

dynamic _parseAndDecode(String response) {
  return jsonDecode(response) as dynamic;
}

Future<dynamic> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}

Dio dio() {
  final Dio dio = DioHelper().dio;
  return dio;
}

Dio dioLogin() {
  final Dio dio = DioHelper_Login().dio;
  return dio;
}

Dio dioPG() {
  final Dio dio = DioHelper_PG().dio;
  return dio;
}

class DebugMode {
  static bool get isInDebugMode {
    const bool inDebugMode = true;

    return inDebugMode;
  }
}
