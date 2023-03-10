// ignore_for_file: file_names, avoid_print

import 'dart:async';


import 'package:deira_flutter/Models/Availability.dart';
import 'package:deira_flutter/Models/CitySearch.dart';
import 'package:deira_flutter/Models/HostCheck.dart';
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


  Future<CityRS> postCity(CityRQ requestModel) async {

    var url = ApiUrls.fetchCity;

    final response = await dio()
        .post(url,data: requestModel.toJson(),)
        .catchError((error) {
      DioError dioError = error;
      print(dioError.response!.statusCode);
    });

    if (response.statusCode == 200) {
      return CityRS.fromJson(response.data as Map<String,dynamic>);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future<AvailabilityRS> postAvailability(AvailibiltyRQ requestModel) async {

    var url = ApiUrls.availability;

    final response = await dio()
        .post(url,data: requestModel.toJson(),)
        .catchError((error) {
      DioError dioError = error;
      print(dioError.response!.statusCode);
    });

    if (response.statusCode == 200) {
      return AvailabilityRS.fromJson(response.data as Map<String,dynamic>);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }


  Future<HostCheckRS> postInvokeHostCheck(HostCheckRQ requestModel) async {

    var url = ApiUrls.InvokeHostCheck;

    final response = await dio()
        .post(url,data: requestModel.toJson(),)
        .catchError((error) {
      DioError dioError = error;
      print(dioError.response!.statusCode);
    });

    if (response.statusCode == 200) {
      return HostCheckRS.fromJson(response.data as Map<String,dynamic>);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

}
