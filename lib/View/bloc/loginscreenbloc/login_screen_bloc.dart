

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/network/apiService.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../../Helper/utilities.dart';
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

      if(event is LoginScreenBlocLoadingEvent){

        // request.strUsername = usernameController.text.trim();
        // request.strPassword = passwordController.text.trim();
        request.strUsername = "abdulwajeed9327@gmail.com";
        request.strPassword = "admin";
        EasyLoading.show(status: ConstantVariableClass.loadingString);


        await apiService.postLogin(request).then((value) async {

          if (value != null) {
            if(value.strErrorMsg == 'Success'){
              EasyLoading.showSuccess("Logged In");
              emit(LoginScreenBlocLoadingFinishedState());
            }else{
              EasyLoading.showSuccess("Faled Log In");
              Utilities.showToast("${value.strErrorMsg}");
            }
          }

        }, onError: (error) {
          print(error);
        });

      }

    });
  }
}
