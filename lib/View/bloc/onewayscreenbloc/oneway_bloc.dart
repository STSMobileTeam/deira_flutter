import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/Models/Availability.dart';
import 'package:deira_flutter/network/apiService.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'oneway_event.dart';
part 'oneway_state.dart';

class OnewayBloc extends Bloc<OnewayEvent, OnewayState> {

  List<PXR> pXRArray = [];
  List<AVR> aVRArray = [];

  List<dynamic> FLOarray = ["UAI","OSC","NPC","NPCN","FY","G8","SG","AI"];


  ApiService apiService = ApiService();
  AvailibiltyRQ req = AvailibiltyRQ();
  PSG psg = PSG();
  AGD agd = AGD();
  final futures = <Future>[];
  int responsesReceived = 0;


  final _controller = StreamController<AvailabilityRS>();
  Stream<AvailabilityRS> get responseStream => _controller.stream;

  OnewayBloc() : super(OnewayInitial()) {on<OnewayEvent>((event, emit) async {
      // TODO: implement event handler

    if(event is OnewayInitialEvent){


      for(int i=0; i<FLOarray.length; i++) {

        pXRArray = [];
        aVRArray = [];

        agd.cID = "CSMAA00116";
        agd.uN = "Abdul";
        agd.aPP = "B2C";
        agd.sID = "I";
        agd.vER = "";
        agd.eNV = "Android";
        agd.bID = "CSMAA00116";
        agd.bTID = "CSMAA0011601";
        agd.aGTYP = "CS";
        agd.cORID = "";
        agd.bRID = "BNH001";
        agd.iBRID = "BNH001";
        agd.eMID = "";
        agd.cTCTR = "";
        agd.platform = "B";
        agd.projectID = "INSA02";
        agd.groupID = "";
        agd.aPPCurrency = "AED";

        psg.pXC = 1;
        pXRArray.add(PXR(pXQ: "1",pXT: "ADT"));
        psg.pXR = pXRArray;

        aVRArray.add(AVR(dSN: "HYD",aSN: "DXB",fLD: "20230321",fCO: "E",fTE: "N",isStudentFare: "false",isArmyFare: "false",isSnrCitizenFare: "false",isLabourFare: "false"));

        req.aGD = agd;
        req.pSG = psg;
        req.cYC = "AED";
        req.tRP = "O";
        req.sEG = "I";
        req.hOS = "true";
        req.mRF = "false";
        req.stock = "1A";
        req.wTL = "false";
        req.dSC = "false";
        req.dCF = "N";
        req.cMF = "Y";
        req.paxfare = true;
        req.dFT = false;
        req.cAT = "6E,AK,FZ,G8,G8E,G9,IX,J9,JQ,OG,SG,SGE,SGI,SGJ,TZ,XW,SGC,OSC,I5,6ES,OV,9I,S5,2T,S9,9I,S5,QP,2T";
        req.aVR = aVRArray;
        req.fLO = [FLOarray[i]];

        final future = apiService.postAvailability(req).then((value) async {

          print('---success---');
          _controller.add(value);

        }, onError: (error) {
          print(error);
        });

        futures.add(future);
        emit(OnewayBlocLoadingFinishedState());


      }

      await Future.wait(futures);

      if (responsesReceived == futures.length) {
        print('---ALL DDONE---');
        emit(OnewayAllResponsesReceivedState());
      }


    }

    });
  }

}
