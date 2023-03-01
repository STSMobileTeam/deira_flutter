import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/Models/Availability.dart';
import 'package:deira_flutter/Models/CitySearch.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../network/apiService.dart';

part 'citysearch_event.dart';
part 'citysearch_state.dart';

class CitysearchBloc extends Bloc<CitysearchEvent, CitysearchState> {

  CityRQ request = CityRQ();
  TextEditingController cityname = TextEditingController();
  ApiService apiService = ApiService();
  AirCodeRS AirRes = AirCodeRS();
  bool IsResponceCame = false;
  bool IsChecking = false;

  List<AirCodeRS> List_AirCode = [];


  CitysearchBloc() : super(CitysearchInitial()) {
    on<CitysearchEvent>((event, emit) async{
      // TODO: implement event handler

      if(event is CitysearchLoadingEvent){

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
        req.name = cityname.text.trim();
        req.type = "name";
        req.category = "Airline";

        await apiService.postCity(req).then((value) async {

          IsResponceCame = true;
          IsChecking = false;

          if (value.resultCode == '1') {


            String ArrayText = value.oUT!;
            var tagsJson = jsonDecode(ArrayText);
            List<dynamic> rolearray = List.from(tagsJson);

            List_AirCode.clear();

            for(int i=0;i<rolearray.length;i++){

              AirCodeRS x = AirCodeRS();
              x.cityCode = rolearray[i]["CityCode"];
              x.cityName = rolearray[i]["CityName"];
              x.citySEARCHNAME = rolearray[i]["CitySEARCHNAME"];

              List_AirCode.add(x) ;

            }
          }

          emit(CitysearchBlocLoadingFinishedState());


        }, onError: (error) {
          print(error);
        });

      }

    });
  }
}


