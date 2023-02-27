

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/network/apiService.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Tables> List_Login = [];


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

              String ArrayText = value.strResult!;
              var tagsList_Login = jsonDecode(ArrayText);
              List<dynamic> rolearray = List.from(tagsList_Login['Table']);

              List_Login.clear();

              for(int i=0;i<rolearray.length;i++){

                Tables x = Tables();
                x.lGNTERMINALID = rolearray[i]["LGN_TERMINAL_ID"];
                x.lGNAGENTID = rolearray[i]["LGN_AGENT_ID"];
                x.uSDUSERTITLE = rolearray[i]["USD_USER_TITLE"];
                x.uSDNAME = rolearray[i]["USD_NAME"];
                x.uSDLASTNAME = rolearray[i]["USD_LAST_NAME"];
                x.uSDMOBILENO = rolearray[i]["USD_MOBILENO"];
                x.cLTADDRESS1 = rolearray[i]["CLT_ADDRESS1"];
                x.cLTCITYID = rolearray[i]["CLT_CITY_ID"];
                x.cLTCOUNTRYID = rolearray[i]["CLT_COUNTRY_ID"];
                x.cLTBRANCHID = rolearray[i]["CLT_BRANCH_ID"];
                x.uSDPASSWORD = rolearray[i]["USD_PASSWORD"];
                x.uSDMOBILENO = rolearray[i]["USD_PASSPORT_NO"];
                x.dOB = rolearray[i]["DOB"];
                x.column1 = rolearray[i]["Column1"];
                x.uSDISSUEDCOUNTRY = rolearray[i]["USD_ISSUED_COUNTRY"];
                x.cLTZIPCODE = rolearray[i]["CLT_ZIP_CODE"];
                x.uSDCOMPANYCODE = rolearray[i]["USD_COMPANY_CODE"];
                x.uSDCODE = rolearray[i]["USD_CODE"];
                x.uSDCOMPANYCODE1 = rolearray[i]["USD_COMPANY_CODE1"];
                x.cLTCLIENTNAME1 = rolearray[i]["CLT_CLIENT_NAME1"];
                x.cLTBRANCHID1 = rolearray[i]["CLT_BRANCH_ID1"];
                x.cLTCORPTYPE = rolearray[i]["CLT_CORP_TYPE"];
                x.thread = rolearray[i]["Thread"];
                x.thread1 = rolearray[i]["Thread1"];
                x.thread2 = rolearray[i]["Thread2"];
                x.thread3 = rolearray[i]["Thread3"];
                x.thread4 = rolearray[i]["Thread4"];
                x.lCCThread = rolearray[i]["LCCThread"];
                x.fSCThread = rolearray[i]["FSCThread"];
                x.fULLTHREAD = rolearray[i]["FULL_THREAD"];
                x.aIRLINEURL = rolearray[i]["AIRLINE_URL"];
                x.bANNERURL = rolearray[i]["BANNER_URL"];

                List_Login.add(x) ;

              }

              final SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setString("TERMINAL_ID", List_Login[0].lGNTERMINALID.toString());
              prefs.setString("AGENT_ID", List_Login[0].lGNAGENTID.toString());
              prefs.setString("BRANCH_ID", List_Login[0].cLTBRANCHID.toString());
              prefs.setString("USE_NAME", List_Login[0].cLTCLIENTNAME.toString());
              prefs.setString("USE_PASSWORD", List_Login[0].uSDPASSWORD.toString());
              prefs.setString("FIRST_NAME", List_Login[0].uSDNAME.toString());
              prefs.setString("LAST_NAME", List_Login[0].uSDLASTNAME.toString());
              prefs.setString("CLT_CORP_TYPE", List_Login[0].cLTCORPTYPE.toString());
              prefs.setString("USE_DOB", List_Login[0].dOB.toString());
              prefs.setString("ProjectID", "INSA02");
              prefs.setString("AppTYP", "B2C");
              prefs.setString("BANNER_URL", List_Login[0].bANNERURL.toString());

              prefs.setString("USD_MOBILENO", List_Login[0].uSDMOBILENO.toString());
              prefs.setString("USD_EMAIL", List_Login[0].cLTCLIENTNAME.toString());
              prefs.setString("CLT_ADDRESS1", List_Login[0].cLTADDRESS1.toString());
              prefs.setString("CLT_COUNTRY_ID", List_Login[0].cLTCOUNTRYID.toString());
              prefs.setString("CLT_ZIP_CODE", List_Login[0].cLTZIPCODE.toString());
              prefs.setString("CLT_BRANCH_ID", List_Login[0].cLTBRANCHID.toString());
              prefs.setString("USD_USER_TITLE", List_Login[0].uSDUSERTITLE.toString());

              prefs.setString("FullThread","1A|G9|TZ|3L|QP|ZO|SGJ|G8M|6EC|6E|IX|XW|OV|I5|UAI|SGC|G8S|I5C|AK|J9|BA|EK|S5|NDC|OSC|6EM|QPM|FZ|JQ|WY|SS|2T|SGE|G8E|SGS|1AAA|G8|SG|SQ|9I|S9|SGI|6ES|G8C|1ASQ");
              prefs.setString("FullThread_1","G8|G8N,G8|G8E,G8|G8M,G8|G8C,G8|G8R,6E|6EN,FZ|FZN,SG|SGN,PF|PFN,OSC|ALL,NPC|NPCN,FY|ALL,UAI|ALL,UAI|UKC");

              prefs.setString("Thread", List_Login[0].thread.toString());
              prefs.setString("Thread1", List_Login[0].thread1.toString());
              prefs.setString("Thread2", List_Login[0].thread2.toString());
              prefs.setString("Thread3", List_Login[0].thread3.toString());
              prefs.setString("Thread4", List_Login[0].thread4.toString());
              prefs.setString("LCCThread", List_Login[0].lCCThread.toString());
              prefs.setString("Signupsuccess", "1");
              prefs.setString("Logintohome", "T");
              
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
