import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:deira_flutter/Models/Availability.dart';
import 'package:deira_flutter/network/apiService.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//  int selectedIndex = 0;

  final _controller = StreamController<AvailabilityRS>();
  Stream<AvailabilityRS> get responseStream => _controller.stream;


  OnewayBloc() : super(OnewayInitial()) {on<OnewayEvent>((event, emit) async {
      // TODO: implement event handler

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String UN, BID, BTID, ProjectID, BranchID, AgentType,AppTYP;

    String FromCode,ToCode,AdtCount,ChdCount,InfCount,TripType,Class;

    UN = prefs.getString("FIRST_NAME")!;
    BID = prefs.getString("AGENT_ID")!;
    BTID = prefs.getString("TERMINAL_ID")!;
    ProjectID = prefs.getString("ProjectID")!;
    BranchID = prefs.getString("BRANCH_ID")!;
    AgentType = prefs.getString("CLT_CORP_TYPE")!;
    AppTYP = prefs.getString("AppTYP")!;

    FromCode = prefs.getString("FromCode")!;
    ToCode = prefs.getString("ToCode")!;
    AdtCount = prefs.getString("AdtCount")!;
    ChdCount = prefs.getString("ChdCount")!;
    InfCount = prefs.getString("InfCount")!;
    TripType = prefs.getString("TripType")!;
    Class = prefs.getString("Class")!;

    if(event is OnewayInitialEvent){

      for(int i=0; i<FLOarray.length; i++) {

        pXRArray = [];
        aVRArray = [];

        agd.cID = BID;
        agd.uN = UN;
        agd.aPP = AppTYP;
        agd.sID = "I";
        agd.vER = "";
        agd.eNV = "Android";
        agd.bID = BID;
        agd.bTID = BTID;
        agd.aGTYP = AgentType;
        agd.cORID = "";
        agd.bRID = BranchID;
        agd.iBRID = BranchID;
        agd.eMID = "";
        agd.cTCTR = "";
        agd.platform = "B";
        agd.projectID = ProjectID;
        agd.groupID = "";
        agd.aPPCurrency = "AED";

        int A = int.parse(AdtCount);
        int C = int.parse(ChdCount);
        int I = int.parse(InfCount);

        int TotPax = A + C + I;

        psg.pXC = TotPax;

        pXRArray.add(PXR(pXQ: AdtCount,pXT: "ADT"));

        if (C > 0) {
          pXRArray.add(PXR(pXQ: ChdCount,pXT: "CHD"));
        }

        if (I > 0) {
          pXRArray.add(PXR(pXQ: InfCount,pXT: "INF"));
        }



        psg.pXR = pXRArray;

        aVRArray.add(AVR(dSN: FromCode,aSN: ToCode,fLD: "20230321",fCO: Class,fTE: "N",isStudentFare: "false",isArmyFare: "false",isSnrCitizenFare: "false",isLabourFare: "false"));

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

        final json = jsonEncode(req.toJson());
        print('---REQUEST---'+json..toString());

        final future = apiService.postAvailability(req).then((value) async {

          responsesReceived++;
          //print('---responsesReceived---'+responsesReceived.toString());

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
        // emit(OnewayAllResponsesReceivedState());
      }


    }

    });
  }

}
