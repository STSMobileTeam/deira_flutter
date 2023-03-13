import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:deira_flutter/Helper/size_config.dart';
import 'package:deira_flutter/View/bloc/onewayscreenbloc/oneway_bloc.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Colors.dart';
import '../../Helper/utilities.dart';
import '../../Models/Availability.dart';
import '../../Widget/Cardview_flightDetails.dart';
import '../../Widget/Cardview_flightFare.dart';
import '../../Widget/Carview_OnewayAvailbility.dart';
import '../../Widget/DialogCommon.dart';
import '../../Widget/customProgress.dart';

class OnewayScreen extends StatefulWidget {
  const OnewayScreen({Key? key}) : super(key: key);

  @override
  State<OnewayScreen> createState() => _OnewayScreenState();
}

class _OnewayScreenState extends State<OnewayScreen> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  late OnewayBloc bloc;

  List<FAvail> AvailMain = [];
  List<FAvail> AvailMainGrpp = [];
  List<FAvail> AvailMainx = [];

  DateTime dt1 = DateTime.now();

  List<Flights> flightsDetails = [];

  String ResultCode = "0";
  bool IsAllResCame = true;
  String FromDate="",Traveller="",FromCode="",ToCode="";

  List<String> KeysValue = [];

  int A = 0;
  int C = 0;
  int I = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<OnewayBloc>(context);
    initial_load();
  }

  Future<void> initial_load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FromDate = prefs.getString("FromDate").toString();

    String AdtCount,ChdCount,InfCount;

    AdtCount = prefs.getString("AdtCount")!;
    ChdCount = prefs.getString("ChdCount")!;
    InfCount = prefs.getString("InfCount")!;
    FromCode = prefs.getString("FromCode")!;
    ToCode = prefs.getString("ToCode")!;

    A = int.parse(AdtCount);
    C = int.parse(ChdCount);
    I = int.parse(InfCount);

    int TotPax = A + C + I;
    Traveller = TotPax.toString();

    dt1 = DateTime.parse(FromDate);

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smokewhite,
      appBar: AppBar(
        backgroundColor: primary_blue,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        flexibleSpace: Container(
          color: primary_blue,
          child: Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical!*0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: SizeConfig.blockSizeHorizontal!*15,),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: FromCode==""?"":FromCode,
                            color: Colors.white,
                            size: SizeConfig.screenWidth! * large_text,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          CustomText(
                            text: ToCode==""?"":ToCode,
                            color: Colors.white,
                            size: SizeConfig.screenWidth! * large_text,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 0.5,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: FromDate!=""?Utilities.dateconversion("EEE, d MMM yyyy",FromDate):"",
                            color: Colors.white,
                            size: SizeConfig.screenWidth! * 0.030,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 0.5,
                          ),
                          CustomText(
                            text: "|",
                            color: Colors.white,
                          ),
                          CustomText(
                            text: Traveller!=""?Traveller+" Traveller(s) ":"0 Traveller(s)",
                            color: Colors.white,
                            size: SizeConfig.screenWidth! * 0.030,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 0.5,
                          ),
                          CustomText(
                            text: "|",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 0.5,
                          ),
                          CustomText(
                            text: AvailMain.isNotEmpty?AvailMain.length.toString()+" Flight":" 0 Flight",
                            color: Colors.white,
                            size: SizeConfig.screenWidth! * 0.030,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Visibility(
                    visible: IsAllResCame,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/images/white_loader.gif'),
                          gaplessPlayback: true,
                          fit: BoxFit.cover,
                          width: SizeConfig.blockSizeHorizontal! * 9,
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: smokewhite,
        child: BlocListener<OnewayBloc, OnewayState>(
          listener: (context, state) {
            // TODO: implement listener

            if(state is OnewayBlocLoadingFinishedState){
              bloc.responseStream.listen((response) {
                print('--' + response.toString()); // bind the response here
                print('----RESULT CODE-----' + response.resultCode.toString());
                print('----RESULT responsesReceived-----' +
                    bloc.responsesReceived.toString());
                print('----RESULT futures-----' + bloc.futures.length.toString());

                ResultCode = response.resultCode.toString();

                if (ResultCode == "1") {
                  AvailMainx.clear();
                  AvailMainx = response.lFAvail!;
                  AvailMain.addAll(AvailMainx);

                  int compareInteger(
                      bool ascending, double value1, double value2) =>
                      ascending
                          ? value1.compareTo(value2)
                          : value2.compareTo(value1);

                  AvailMain.sort((user1, user2) => compareInteger(
                      true, Utilities.Actual_fare_Avail(A,C,I,user1.fare!,user1.flights![0].paxType!), Utilities.Actual_fare_Avail(A,C,I,user2.fare!,user2.flights![0].paxType!)));

                }

                if (bloc.futures.length == bloc.responsesReceived) {

                  //Key formation
                  for (int k = 0; k < AvailMain.length; k++) {
                    String DepartureTime = AvailMain[k].departureTime!;
                    String JourneyTime = AvailMain[k].journeyTime!;
                    String PlatingCarrier =
                    AvailMain[k].flights![0].platingCarrier!;

                    String Keys = PlatingCarrier + JourneyTime + DepartureTime;

                    AvailMain[k].unikey = Keys.toString();

                    KeysValue.add(Keys);
                  }

                  //Grouping
                  List<String> result =
                  LinkedHashSet<String>.from(KeysValue).toList();
                  KeysValue.clear();
                  KeysValue = result;

                  for (int m = 0; m < KeysValue.length; m++) {
                    String keySM = KeysValue[m];

                    List<FAvail> groupArray = [];

                    for (int p = 0; p < AvailMain.length; p++) {
                      String gettKey = AvailMain[p].unikey!;

                      if (keySM == gettKey) {
                        print("==Adding Fare==" + p.toString() + " " + AvailMain[p].fare.toString());
                        groupArray.add(AvailMain[p]);
                      }

                    }


                    AvailMainGrpp.insert(m, FAvail(
                        fare: groupArray[0].fare,
                        departureTime: groupArray[0].departureTime,
                        journeyTime: groupArray[0].journeyTime,
                        flights: groupArray[0].flights,
                        flightsgrp: groupArray));


                  }



                  AvailMain.clear();

                  AvailMain.addAll(AvailMainGrpp);

                  IsAllResCame = false;

                  String json = jsonEncode(AvailMain.map((model) => model.toJson()).toList());
                  print("== "+" "+json);

                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    // Do Something here
                    _controller.animateToDate(dt1);
                  });

                }




                setState(() {});
              });
            }

            if(state is OnewayFareEventLoadingFinishedState){
              print("----wikajknskjbskjdfsdc---XX");

              EasyLoading.showSuccess("Done");

              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext
                    context) {
                      return DialogCoomon(title: 'Confirmation Alert',Message: bloc.Message,hstres: bloc.HstRes);
                    });
              });
            }

            // Don't forget to dispose of the bloc when you're done with it
          },
          child: BlocBuilder<OnewayBloc, OnewayState>(
            builder: (context, state) {
              return Column(
                children: [
                  Visibility(
                    visible: IsAllResCame,
                    child: LinearProgressIndicator(
                      minHeight: 1,
                      backgroundColor: secondary_blue,
                      valueColor: AlwaysStoppedAnimation<Color>(primary_blue),
                    ),
                  ),
                  Visibility(
                    visible: !IsAllResCame,
                    child: Container(
                      color: primary_blue,
                      child: DatePicker(
                        DateTime.now(),
                        width: 60,
                        height: 80,
                        controller: _controller,
                        initialSelectedDate: dt1==DateTime.now()?DateTime.now():dt1,
                        selectionColor: dateselect_blue,
                        selectedTextColor: Colors.white,
                        monthTextStyle: TextStyle(color: Colors.white),
                        dateTextStyle: TextStyle(color: Colors.white),
                        dayTextStyle: TextStyle(color: Colors.white),
                        onDateChange: (date) async {

                          _selectedValue = date;

                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("FromDate",Utilities.dateconversion("yyyyMMdd",_selectedValue.toString()));

                          AvailMain.clear();
                          AvailMainGrpp.clear();
                          AvailMainx.clear();;
                          flightsDetails.clear();
                          KeysValue.clear();

                          FromDate = Utilities.dateconversion("yyyyMMdd",_selectedValue.toString());

                          // New date selected
                          setState(() {
                            IsAllResCame = true;
                            print(_selectedValue);
                            dt1 = _selectedValue;
                            AvailMain.clear();
                            bloc.add(OnewayInitialEvent());
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          color: smokewhite,
                          child: !IsAllResCame & AvailMain.isEmpty ? Column(
                            children: [
                              SizedBox(height: SizeConfig.blockSizeVertical!*4,),
                              Image.asset(
                                "assets/images/noflightfound.png",
                                scale: 1.0,
                              ),
                              SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                              CustomText(text: "No flights found, Modify your search",color: primary_blue,weight: FontWeight.bold,size: SizeConfig.screenWidth!*medium_text,),
                              SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                              MaterialButton(
                                minWidth: SizeConfig.blockSizeHorizontal! * 40,
                                height: SizeConfig.blockSizeVertical! * 5,
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 14, bottom: 14),
                                child: Text(
                                  'Modify Search',
                                  style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text),
                                ),
                                color: primary_blue,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ) :
                          AvailMain.isNotEmpty
                              ? Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical!*2, vertical: SizeConfig.blockSizeVertical!*4),
                                      height: SizeConfig.blockSizeVertical!*6,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        color: Colors.black.withOpacity(0.5),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5.0,
                                            offset: new Offset(5.0, 5.0),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex:1,
                                              child: CustomText(size: SizeConfig.screenWidth!*tiny_text,textAlign: TextAlign.center,text: 'SORT\nBY',color: Colors.white,weight: FontWeight.bold,)
                                          ),
                                          Expanded(
                                              flex:5,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: [
                                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8),
                                                    child: Container(
                                                      width: SizeConfig.blockSizeHorizontal!*20,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(color: Colors.white),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(8)),
                                                      ),
                                                      child: Center(
                                                        child: CustomText(
                                                          text: "Cheapest\nFirst",
                                                          color: textgrey,
                                                          textAlign: TextAlign.center,
                                                          weight: FontWeight.bold,
                                                          size: SizeConfig.screenWidth!*0.030,
                                                        ),
                                                      ),
                                                      padding: EdgeInsets.all(2),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8),
                                                    child: Container(
                                                      width: SizeConfig.blockSizeHorizontal!*20,
                                                      decoration: BoxDecoration(
                                                        color: blackblue,
                                                        border: Border.all(color: blackblue),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(8)),
                                                      ),
                                                      child: Center(
                                                        child: CustomText(
                                                          text: "Highest\nFirst",
                                                          color: Colors.white,
                                                          textAlign: TextAlign.center,
                                                          weight: FontWeight.bold,
                                                          size: SizeConfig.screenWidth!*0.030,
                                                        ),
                                                      ),
                                                      padding: EdgeInsets.all(2),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8),
                                                    child: Container(
                                                      width: SizeConfig.blockSizeHorizontal!*20,
                                                      decoration: BoxDecoration(
                                                        color: blackblue,
                                                        border: Border.all(color: blackblue),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(8)),
                                                      ),
                                                      child: Center(
                                                        child: CustomText(
                                                          text: "Earliest\nFirst",
                                                          color: Colors.white,
                                                          textAlign: TextAlign.center,
                                                          weight: FontWeight.bold,
                                                          size: SizeConfig.screenWidth!*0.030,
                                                        ),
                                                      ),
                                                      padding: EdgeInsets.all(2),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8),
                                                    child: Container(
                                                      width: SizeConfig.blockSizeHorizontal!*20,
                                                      decoration: BoxDecoration(
                                                        color: blackblue,
                                                        border: Border.all(color: blackblue),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(8)),
                                                      ),
                                                      child: Center(
                                                        child: CustomText(
                                                          text: "Fastest\nFirst",
                                                          color: Colors.white,
                                                          textAlign: TextAlign.center,
                                                          weight: FontWeight.bold,
                                                          size: SizeConfig.screenWidth!*0.030,
                                                        ),
                                                      ),
                                                      padding: EdgeInsets.all(2),
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Expanded(
                                              flex:1,
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        const Color(0xFF3366FF),
                                                        const Color(0xFF00CCFF),
                                                      ],
                                                      begin: const FractionalOffset(0.0, 0.0),
                                                      end: const FractionalOffset(1.0, 0.0),
                                                      stops: [0.0, 1.0],
                                                      tileMode: TileMode.clamp),
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/images/filterfilled.svg',
                                                  width: 5.0,
                                                  height: 5.0,
                                                  color: Colors.white,
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                      padding: const EdgeInsets.only(
                                          bottom: kFloatingActionButtonMargin + 48),
                                      shrinkWrap: true,
                                      itemCount: AvailMain.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () async {
                                            print('Printing the index--' +
                                                index.toString());
                                            print('AvailMain flights grp length--' +
                                                AvailMain[index]
                                                    .flights!
                                                    .length
                                                    .toString());
                                            print('AvailMain length--' +
                                                AvailMain.length.toString());

                                            PopupFareDetails(context, index,
                                                AvailMain[index].flights!,AvailMain);

                                            for (int x = 0; x < AvailMain[index].flightsgrp!.length; x++) {

                                              print('Printing the token--' + x.toString() + ' ' +
                                                  AvailMain[index].flightsgrp![x].flights![0].refNum.toString());

                                            }

                                          },
                                          child: OnewayAvilCard(
                                            carrierCode: AvailMain[index]
                                                .flights![0]
                                                .platingCarrier,
                                            carriername: AvailMain[index]
                                                .flights![0]
                                                .airlineName,
                                            depTime: AvailMain[index]
                                                .flights![0]
                                                .departureTime,
                                            depCity:
                                            AvailMain[index].flights![0].origin,
                                            journeyHrs: Utilities.durationToString(
                                                AvailMain[index].journeyTime),
                                            stops: AvailMain[index]
                                                .flights![AvailMain[index]
                                                .flights!
                                                .length -
                                                1]
                                                .stops,
                                            arrTime: AvailMain[index]
                                                .flights![AvailMain[index]
                                                .flights!
                                                .length -
                                                1]
                                                .arrivalTime,
                                            arrCity: AvailMain[index]
                                                .flights![AvailMain[index]
                                                .flights!
                                                .length -
                                                1]
                                                .destination,
                                            amount: Utilities.Actual_fare_Avail(A,C,I,AvailMain[index].fare!,AvailMain[index].flights![0].paxType!).toStringAsFixed(2),
                                            seatCount: AvailMain[index]
                                                .flights![0]
                                                .availSeat,
                                            baggage: AvailMain[index]
                                                .flights![0]
                                                .baggage,
                                            refund: 'N',
                                          ),
                                        );
                                      }),

                                ],
                              )
                              : Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/loaderflight.gif'),
                                                gaplessPlayback: true,
                                                fit: BoxFit.cover),
                                            SizedBox(
                                              height:
                                                  SizeConfig.blockSizeVertical! *
                                                      1,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                  text: 'Fetching Your Flights',
                                                  weight: FontWeight.bold,
                                                  color: primary_blue,
                                                  size: SizeConfig.screenWidth! *
                                                      medium_text,
                                                ),
                                                SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeVertical! *
                                                      1,
                                                ),
                                                Image.asset(
                                                    'assets/images/fetchingitern.gif',
                                                    height: 200,
                                                    width: 50,
                                                    scale: 2),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                      )
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  PopupFareDetails(context, int pos, List<Flights> AvailMain,List<FAvail> Availgrp) {

    int selectedIndex=0;
    //String FareAmount=Availgrp[pos].flightsgrp![0].flights![0].grossFare!.toString();
    String FareAmount = Utilities.Actual_fare_Avail(A,C,I,Availgrp[pos].flightsgrp![0].flights![0].grossFare!,Availgrp[pos].flightsgrp![0].flights![0].paxType!).toStringAsFixed(2);
    String Token = "";

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
              heightFactor: 0.93,
              child: StatefulBuilder(
                builder: (BuildContext context, setState) =>
                 Column(children: [
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical! * 1.2,
                          horizontal: SizeConfig.blockSizeHorizontal! * 0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal! * 2),
                                child: CustomText(
                                  text: 'Flight Information',
                                  weight: FontWeight.bold,
                                  size: SizeConfig.screenWidth! * 0.045,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black54,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(scrollDirection: Axis.vertical, children:[
                      Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1.5,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/deira_blu_wo_txt.gif'),
                                gaplessPlayback: true,
                                fit: BoxFit.fill,
                                width: SizeConfig.blockSizeHorizontal! * 100,
                                height: SizeConfig.blockSizeVertical! * 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: FromCode==""?"":FromCode,
                                        weight: FontWeight.bold,
                                        color: Colors.white,
                                        size: SizeConfig.screenWidth! * large_text,
                                      ),
                                      SizedBox(
                                        width:
                                        SizeConfig.blockSizeHorizontal! * 1.5,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width:
                                        SizeConfig.blockSizeHorizontal! * 1.5,
                                      ),
                                      CustomText(
                                        text: ToCode==""?"":ToCode,
                                        weight: FontWeight.bold,
                                        color: Colors.white,
                                        size: SizeConfig.screenWidth! * large_text,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 1.2,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "Non-Stop",
                                          weight: FontWeight.normal,
                                          color: Colors.white,
                                          size:
                                          SizeConfig.screenWidth! * small_text,
                                        ),
                                        SizedBox(
                                          width:
                                          SizeConfig.blockSizeHorizontal! * 0.5,
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        SizedBox(
                                          width:
                                          SizeConfig.blockSizeHorizontal! * 0.5,
                                        ),
                                        CustomText(
                                          text: "2h 50m",
                                          weight: FontWeight.normal,
                                          color: Colors.white,
                                          size:
                                          SizeConfig.screenWidth! * small_text,
                                        ),
                                        SizedBox(
                                          width:
                                          SizeConfig.blockSizeHorizontal! * 0.5,
                                        ),
                                        VerticalDivider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        SizedBox(
                                          width:
                                          SizeConfig.blockSizeHorizontal! * 0.5,
                                        ),
                                        CustomText(
                                          text: "Economy",
                                          weight: FontWeight.normal,
                                          color: Colors.white,
                                          size:
                                          SizeConfig.screenWidth! * small_text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),  
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1.5,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: AvailMain.length,
                              itemBuilder: (context, index) {
                                //print('Printing the index--'+x.toString()+' '+AvailMain[index].flightsgrp![x].fare.toString());
                                return FlightDetailsCard(
                                  carrierCode: AvailMain[index].platingCarrier,
                                  carriername: AvailMain[index].airlineName,
                                  depTime: AvailMain[index].departureTime,
                                  depCity: AvailMain[index].origin,
                                  journeyHrs: Utilities.durationToString('600'),
                                  stops: AvailMain[AvailMain.length - 1].stops,
                                  arrTime: AvailMain[index].arrivalTime,
                                  arrCity: AvailMain[index].destination,
                                  amount: Utilities.Actual_fare_Avail(A,C,I,AvailMain[index].grossFare!,AvailMain[index].paxType!).toStringAsFixed(2),
                                  seatCount: AvailMain[index].availSeat,
                                  baggage: AvailMain[index].baggage,
                                  refund: 'N',
                                  flightno: AvailMain[index].flightNumber,
                                  depDateTime: AvailMain[index].departureDateTime,
                                  arrDateTime: AvailMain[index].arrivalDateTime,
                                  flytime: AvailMain[index].flyingTime,
                                );
                              }),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal!*2.5),
                                  child: CustomText(
                                    text: "Select Fare",
                                    weight: FontWeight.bold,
                                    size: SizeConfig.screenWidth! * large_text,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal!*2.5),
                                  child: CustomText(
                                    text: "Total Fare : "+Availgrp[pos].flightsgrp!.length.toString(),
                                    weight: FontWeight.bold,
                                    size: SizeConfig.screenWidth! * medium_text,
                                    color: textgrey,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1.5,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Availgrp[pos].flightsgrp!.length,
                              itemBuilder: (context, index) {
                                //print('Printing the index--'+x.toString()+' '+AvailMain[index].flightsgrp![x].fare.toString());
                                return InkWell(
                                  onTap: () async {

                                    print('Printing the token--' + index.toString() + ' ' +
                                        Availgrp[pos].flightsgrp![index].flights![0].refNum!.toString());

                                    selectedIndex = index;

                                    FareAmount = Utilities.Actual_fare_Avail(A,C,I,Availgrp[pos].flightsgrp![index].flights![0].grossFare!,Availgrp[pos].flightsgrp![index].flights![0].paxType!).toStringAsFixed(2);
                                    Token = Availgrp[pos].flightsgrp![index].flights![0].refNum!.toString();

                                    setState(() {
                                      print('index '+index.toString());
                                      print('selected index '+selectedIndex.toString());
                                    });

                                  },
                                  child: FareCardAvail(
                                    farecode: Availgrp[pos].flightsgrp![index].flights![0].fareBasisCode,
                                    faredesc: Availgrp[pos].flightsgrp![index].flights![0].fareTypeDescription,
                                    amount: Utilities.Actual_fare_Avail(A,C,I,Availgrp[pos].flightsgrp![index].flights![0].grossFare!,Availgrp[pos].flightsgrp![index].flights![0].paxType!).toStringAsFixed(2),
                                    token: Availgrp[pos].flightsgrp![index].flights![0].refNum,
                                    selectedIndex: selectedIndex,
                                    faretype: Availgrp[pos].flightsgrp![index].flights![0].fareType,
                                    index: index,
                                    baggage: Availgrp[pos].flightsgrp![index].flights![0].baggage,
                                  ),
                                );
                              }),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 0.7,
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    color: primary_blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex:1,
                            child: Padding(
                              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical!*1.8,bottom: SizeConfig.blockSizeVertical!*1.8,left: SizeConfig.blockSizeHorizontal!*3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Total Amount",size: SizeConfig.screenWidth!*small_text,color: secondary_blue,),
                                  SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                                  CustomText(text: 'AED '+ FareAmount,weight: FontWeight.bold,size: SizeConfig.screenWidth!*large_text_extra,color: Colors.white,),
                                ],
                              ),
                            )
                        ),
                        Expanded(flex:1,
                            child: Padding(
                              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical!*1.8,bottom: SizeConfig.blockSizeVertical!*1.8,left: SizeConfig.blockSizeHorizontal!*3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: MaterialButton(
                                      minWidth: SizeConfig.blockSizeHorizontal! * 40,
                                      height: SizeConfig.blockSizeVertical! * 5,
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, top: 14, bottom: 14),
                                      child: Text(
                                        'Proceed',
                                        style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text),
                                      ),
                                      color: Colors.white,
                                      textColor: primary_blue,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                      onPressed: () {

                                        bloc.Token = Token;
                                        bloc.add(OnewayFareEvent());

                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  )
                ]),
              ));
        });

  }


}



