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

  ApiService apiService = ApiService();
  AvailibiltyRQ req = AvailibiltyRQ();
  PSG psg = PSG();
  AGD agd = AGD();

  final _controller = StreamController<String>();
  Stream<String> get responseStream => _controller.stream;

  OnewayBloc() : super(OnewayInitial()) {on<OnewayEvent>((event, emit) async {
      // TODO: implement event handler

    if(event is OnewayInitialEvent){

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

      aVRArray.add(AVR(dSN: "BOM",aSN: "DXB",fLD: "20230321",fCO: "E",fTE: "N",isStudentFare: "false",isArmyFare: "false",isSnrCitizenFare: "false",isLabourFare: "false"));

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
      req.cAT = "SG";
      req.aVR = aVRArray;
      req.fLO = ["SG"];


      // Future<void> sendRequests(List<String> urls) async {
      //   final dio = Dio();
      //   final futures = <Future>[];
      //
      //   for (final url in urls) {
      //     final future = dio.get(url).then((response) {
      //       _controller.add(response.data);
      //     });
      //     futures.add(future);
      //   }
      //
      //   await Future.wait(futures);
      // }

      final futures = <Future>[];

      for(int i=0; i<3; i++) {

        final future = apiService.postAvailability(req).then((value) async {

          print('---success---');
          _controller.add(value.toString());

        }, onError: (error) {
          print(error);
        });

        futures.add(future);

      }
      await Future.wait(futures);


    }

    });
  }

}
