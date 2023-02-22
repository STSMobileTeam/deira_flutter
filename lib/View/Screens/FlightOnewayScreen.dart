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
  List<Flights> flightsDetails = [];

  String ResultCode = "0";

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

              ResultCode = response.resultCode.toString();
              List<FAvail> AvailMainx = response.lFAvail!;
              AvailMain.addAll(AvailMainx);

              //AvailMain.sort((a, b) => int.parse(a.fare!).compareTo(int.parse(b.fare!)));

              int compareInteger(bool ascending, double value1, double value2) =>
                  ascending ? value1.compareTo(value2) : value2.compareTo(value1);

              AvailMain.sort((user1, user2) => compareInteger(
                  true, double.parse(user1.fare!), double.parse(user2.fare!)));

              // AvailMain.sort((a, b){
              //   return a.fare!.compareTo(b.fare!);
              //   //softing on numerical order (Ascending order by Roll No integer)
              // });

              if (state is OnewayAllResponsesReceivedState) {
                print('----Request All CAME-----');
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
                        Column(
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
                        )
                      ],
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
                      child: Container(color: grayBg, child: AvailMain.isNotEmpty ?
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
