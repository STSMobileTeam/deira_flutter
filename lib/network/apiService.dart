// ignore_for_file: file_names, avoid_print

import 'dart:async';


import 'package:deira_flutter/Models/Login.dart';
import 'package:dio/dio.dart';


import 'apiurls.dart';
import 'diohelper.dart';

class ApiService {



  Future<LoginRes> postLogin(LoginReq requestModel) async {

    var url = ApiUrls.login;

    final response = await dioLogin()
        .post(url,data: requestModel.toJson(),)
        .catchError((error) {
      DioError dioError = error;
      print(dioError.response!.statusCode);
    });

    if (response.statusCode == 200) {
      return LoginRes.fromJson(response.data as Map<String,dynamic>);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }




}
