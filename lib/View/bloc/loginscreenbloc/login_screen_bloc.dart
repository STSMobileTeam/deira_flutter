

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/network/apiService.dart';
import 'package:meta/meta.dart';

import '../../../Models/Login.dart';
import 'package:flutter/material.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {

  LoginReq request = LoginReq();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiService apiService = ApiService();

  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) async {

      if(event is loginEvent){

        request.strUsername = usernameController.text.trim();
        request.strPassword = passwordController.text.trim();

        await apiService.postLogin(request).then((value) async {


          if (value != null) {

            if(value.b2CMobileGetDetailsResult == true){

            }else{
              //Utilities.showToast("${value.status!.errorMessage}");
            }

          }

        }, onError: (error) {
          print(error);
        });

      }

    });
  }
}
