import 'dart:collection';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:deira_flutter/Helper/size_config.dart';
import 'package:deira_flutter/View/bloc/onewayscreenbloc/oneway_bloc.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Helper/Colors.dart';
import '../../Helper/utilities.dart';
import '../../Models/Availability.dart';
import '../../Widget/Carview_OnewayAvailbility.dart';

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

  List<Flights> flightsDetails = [];

  String ResultCode = "0";
  bool IsAllResCame = true;

  List<String> KeysValue = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<OnewayBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: BlocListener<OnewayBloc, OnewayState>(
          listener: (context, state) {
            // TODO: implement listener
            bloc.responseStream.listen((response) {
              print('--'+response.toString()); // bind the response here
              print('----RESULT CODE-----'+response.resultCode.toString());
              print('----RESULT responsesReceived-----'+bloc.responsesReceived.toString());
              print('----RESULT futures-----'+bloc.futures.length.toString());

              if(bloc.futures.length == bloc.responsesReceived) {

                //Key formation

                for(int k=0;k<AvailMain.length;k++){

                  String DepartureTime = AvailMain[k].departureTime!;
                  String JourneyTime = AvailMain[k].journeyTime!;
                  String PlatingCarrier = AvailMain[k].flights![0].platingCarrier!;

                  String Keys = PlatingCarrier+JourneyTime+DepartureTime;

                  AvailMain[k].unikey = Keys.toString();

                  KeysValue.add(Keys);
                }

                //Grouping
                List<String> result = LinkedHashSet<String>.from(KeysValue).toList();
                KeysValue.clear();
                KeysValue = result;

                List<Flights> groupArray = [];

                for(int m=0; m<KeysValue.length; m++){

                  String keySM = KeysValue[m];

                  for(int p=0; p<AvailMain.length; p++){
                    String gettKey = AvailMain[p].unikey!;

                    if(keySM == gettKey){
                      groupArray.addAll(AvailMain[p].flights!);
                    }

                  }

                  AvailMainGrpp[m].fare = AvailMain[0].fare;
                  AvailMainGrpp[m].departureTime = AvailMain[0].departureTime;
                  AvailMainGrpp[m].journeyTime = AvailMain[0].journeyTime;
                  AvailMainGrpp[m].flights = groupArray;

                }

                IsAllResCame = false;

              }

              ResultCode = response.resultCode.toString();

              if(ResultCode == "1"){

                List<FAvail> AvailMainx = response.lFAvail!;
                AvailMain.addAll(AvailMainx);

                int compareInteger(bool ascending, double value1, double value2) =>
                    ascending ? value1.compareTo(value2) : value2.compareTo(value1);

                AvailMain.sort((user1, user2) => compareInteger(
                    true, double.parse(user1.fare!), double.parse(user2.fare!)));

              }


              setState(() {

              });

            });
            // Don't forget to dispose of the bloc when you're done with it
          },
          child: BlocBuilder<OnewayBloc, OnewayState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    color: primary_blue,
                    height: SizeConfig.blockSizeVertical! * 6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical! * 1),
                    color: primary_blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: "BOM",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth! * medium_text,
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
                                    text: "DEL",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth! * medium_text,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 1,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: "Fri, 10 Mar 2023",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth! * small_text,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal! * 1,
                                  ),
                                  CustomText(
                                    text: "|",
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                    text: "1 Traveller(s)",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth! * small_text,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal! * 1,
                                  ),
                                  CustomText(
                                    text: "|",
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                    text: "1 Flights",
                                    color: Colors.white,
                                    size: SizeConfig.screenWidth! * small_text,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image(
                                    image: AssetImage('assets/images/white_loader.gif'),
                                    gaplessPlayback: true,
                                    fit: BoxFit.cover,
                                  width: SizeConfig.blockSizeHorizontal!*9,
                                  height: SizeConfig.blockSizeVertical!*4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: IsAllResCame,
                    child: LinearProgressIndicator(
                      minHeight: 1,
                      backgroundColor: secondary_blue,
                      valueColor: AlwaysStoppedAnimation<Color>(primary_blue),
                    ),
                  ),
                  Container(
                    color: primary_blue,
                    child: DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 80,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: dateselect_blue,
                      selectedTextColor: Colors.white,
                      monthTextStyle: TextStyle(color: Colors.white),
                      dateTextStyle: TextStyle(color: Colors.white),
                      dayTextStyle: TextStyle(color: Colors.white),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                  Expanded(
                      child: Container(color: grayBg,
                          child: AvailMain.isNotEmpty ?
                          ListView.builder(
                          padding: const EdgeInsets.only(
                              bottom: kFloatingActionButtonMargin + 48),
                          shrinkWrap: true,
                          itemCount: AvailMain.length,
                          itemBuilder: (context, index) {
                            return OnewayAvilCard(carrierCode: AvailMain[index].flights![0].platingCarrier,
                              carriername: AvailMain[index].flights![0].airlineName,
                              depTime: AvailMain[index].flights![0].departureTime,
                              depCity: AvailMain[index].flights![0].origin,
                              journeyHrs: Utilities.durationToString(AvailMain[index].journeyTime),
                              stops: AvailMain[index].flights!.length-1,
                              arrTime: AvailMain[index].flights![AvailMain[index].flights!.length-1].arrivalTime,
                              arrCity: AvailMain[index].flights![AvailMain[index].flights!.length-1].destination,
                              amount: AvailMain[index].fare,
                              seatCount: AvailMain[index].flights![0].availSeat,
                              baggage: AvailMain[index].flights![0].baggage,
                              refund: 'N',);
                          }) :
                          Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: SizeConfig.blockSizeVertical!*75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    image: AssetImage('assets/images/loaderflight.gif'),
                                    gaplessPlayback: true,
                                    fit: BoxFit.cover),
                                SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(text: 'Fetching Your Flights',weight: FontWeight.bold,color: primary_blue,size: SizeConfig.screenWidth!*medium_text,),
                                    SizedBox(width: SizeConfig.blockSizeVertical!*1,),
                                    Image.asset('assets/images/fetchingitern.gif',
                                        height: 200,
                                        width: 50,
                                        scale: 2),
                                  ],
                                )
                              ],
                            ),),
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
}
