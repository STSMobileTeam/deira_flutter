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
              AvailMain = response.lFAvail!;

              for(int i=0; i<AvailMain.length; i++){

                AvailMain.add(AvailMain[i]);

                for(int j=0;i<AvailMain.length;j++){
                  flightsDetails.add(AvailMain[j].flights![j]);
                }

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
                      child: Container(color: grayBg, child: flightsDetails.isNotEmpty ? ListView.builder(
                          padding: const EdgeInsets.only(
                              bottom: kFloatingActionButtonMargin + 48),
                          shrinkWrap: true,
                          itemCount: flightsDetails.length,
                          itemBuilder: (context, index) {
                            return OnewayAvilCard(carrierCode: flightsDetails[index].platingCarrier,carriername: 'Spicejet',depTime: flightsDetails[index].departureTime,
                              depCity: flightsDetails[index].destination, journeyHrs: '3h 20m',stops: flightsDetails[index].stops,arrTime: flightsDetails[index].arrivalTime,
                              arrCity: 'DXB',amount: flightsDetails[index].netFare,seatCount: ResultCode, baggage: flightsDetails[index].baggage,
                            refund: 'N',);
                          }) : CircularProgressIndicator(),)
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
