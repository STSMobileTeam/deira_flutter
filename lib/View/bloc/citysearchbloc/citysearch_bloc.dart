import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
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
  List<AirCodeRS> List_AirCode = [];


  CitysearchBloc() : super(CitysearchInitial()) {
    on<CitysearchEvent>((event, emit) async{
      // TODO: implement event handler

      if(event is CitysearchLoadingEvent){

        CityRQ request = CityRQ();
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
        agent.agentType = '';
        agent.issuingPosId = '';
        agent.issuingPosTId = '';
        agent.issuingBranchId = '';
        agent.userTrackId = '';

        request.agent = agent;
        request.name = cityname.text.trim();
        request.type = 'name';
        request.category = 'Airline';

        await apiService.postCity(request).then((value) async {

          IsResponceCame = true;

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
