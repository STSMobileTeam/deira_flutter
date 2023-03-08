import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import '../../../Helper/utilities.dart';
import '../../../Models/CitySearch.dart';
import '../../../Models/HostCheck.dart';
import '../../../network/apiService.dart';

part 'passenger_event.dart';
part 'passenger_state.dart';

class PassengerBloc extends Bloc<PassengerEvent, PassengerState> {

  ApiService apiService = ApiService();

  AirCodeRS AirRes = AirCodeRS();
  bool IsResponceCame = false;
  bool IsChecking = false;

  List<AirCodeRS> List_AirCode = [];

  int responsesReceived = 0;
  int requestIndex = 0;

  HostCheckRS HSRes = new HostCheckRS();


  PassengerBloc() : super(PassengerInitial()) {
    on<PassengerEvent>((event, emit) async {



      if(event is PassengerInitialEvent){

        EasyLoading.show(status: ConstantVariableClass.loadingString);

        print("==="+HSRes.lMFlights!.length.toString());
        
        List<String> Code = [];

        for(int k=0; k<HSRes.lMFlights!.length; k++){

          Code.add(HSRes.lMFlights![k].origin!);
          Code.add(HSRes.lMFlights![k].destination!);

          print("==origin="+HSRes.lMFlights![k].origin!);
          print("==destination="+HSRes.lMFlights![k].destination!);


        }

        List<String> uniqueCode = Code.toSet().toList();

        print("==uniqueCode="+uniqueCode.toString());


        for(int i=0;i<uniqueCode.length;i++){


          CityRQ req = CityRQ();

          Agent agent = Agent();

          agent.agentID = '';
          agent.terminalId = '';
          agent.posId = '';
          agent.postId = '';
          agent.userName = '';
          agent.appType = 'B2B';
          agent.version = '1.0.1';
          agent.branchId = '';
          agent.environment = 'M';
          agent.clientId = '';
          agent.winyatraId = '';
          agent.agentID = '';
          agent.agentType = '';
          agent.issuingPosId = '';
          agent.issuingPosTId = '';
          agent.issuingBranchId = '';
          agent.userTrackId = '';

          req.agent = agent;
          req.name = uniqueCode[i];
          req.type = "code";
          req.category = "Airline";

          requestIndex = i;

          await apiService.postCity(req).then((value) async {

            IsChecking = false;

            responsesReceived++;

            //responseMap[requestIndex] = value as Response;

            if (value.resultCode == '1') {

              String ArrayText = value.oUT!;
              var tagsJson = jsonDecode(ArrayText);
              List<dynamic> rolearray = List.from(tagsJson);

              //List_AirCode.clear();

              for(int i=0;i<rolearray.length;i++){

                AirCodeRS x = AirCodeRS();
                x.cityCode = rolearray[i]["CityCode"];
                x.cityName = rolearray[i]["CityName"];
                x.citySEARCHNAME = rolearray[i]["CitySEARCHNAME"];

                List_AirCode.add(x) ;

              }

            }

          }, onError: (error) {
            print(error);
          });

        }

        print('---responsesReceived---'+responsesReceived.toString());
        print('---requestList---'+uniqueCode.length.toString());


        if (responsesReceived == uniqueCode.length) {
          IsResponceCame = true;
          print('---ALL DDONE---');
          emit(PassengerBlocLoadingFinishedState());
        }


      }


    });
  }


}
