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
  List<AirCodeRS> List_AirCode = [];


  CitysearchBloc() : super(CitysearchInitial()) {
    on<CitysearchEvent>((event, emit) async{
      // TODO: implement event handler

      if(event is CitysearchLoadingEvent){

        AvailibiltyRQ request = AvailibiltyRQ();

        AGD agent = AGD();
        agent.cID = 'CSMAA00116';
        agent.uN = 'Abdul';
        agent.aPP = 'B2C';
        agent.sID = 'I';
        agent.vER = '';
        agent.eNV = 'Android';
        agent.bID = 'CSMAA00116';
        agent.bTID = 'CSMAA0011601';
        agent.aGTYP = 'CS';
        agent.cORID = '';
        agent.bRID = 'BNH001';
        agent.iBRID = 'BNH001';
        agent.eMID = '';
        agent.cTCTR = '';
        agent.platform = 'B';
        agent.projectID = 'INSA02';
        agent.groupID = '';
        agent.aPPCurrency = 'AED';

        PSG pax = PSG();

        PXR px = PXR();
        px.pXT = "Adult";
        px.pXQ = "1";

        pax.pXR = px as List<PXR>?;
        pax.pXC = 1;

        AVR avr = AVR();

        avr.dSN = "BOM";
        avr.aSN = "DXB";
        avr.fLD = "20230321";
        avr.fCO = "E";
        avr.fTE = "N";
        avr.isStudentFare = "false";
        avr.isArmyFare = "false";
        avr.isSnrCitizenFare = "false";
        avr.isLabourFare = "false";

        request.aGD = agent;
        request.pSG = pax;
        request.cYC = "AED";
        request.tRP = "O";
        request.sEG = "I";
        request.hOS = "true";
        request.mRF = "false";
        request.stock = "1A";
        request.wTL = "false";
        request.dSC = "false";
        request.dCF = "N";
        request.cMF = "Y";
        request.paxfare = true;
        request.dFT = false;
        request.cAT = "SG";
        request.fLO = ["SG"];


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


