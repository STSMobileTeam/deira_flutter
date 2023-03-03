import 'package:deira_flutter/View/bloc/passengerscreenbloc/passenger_bloc.dart';
import 'package:deira_flutter/Widget/Cardview_flightDetailsfull.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import '../../Helper/utilities.dart';
import '../../Models/HostCheck.dart';
import '../widgets/customtext.dart';

class PassengerScreen extends StatefulWidget {
  HostCheckRS HSRes;
  PassengerScreen({Key? key,required this.HSRes}) : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {

  late PassengerBloc bloc;

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 0)).then((_) {
      PopupFareDetails(context,widget.HSRes);
    });

    super.initState();

    bloc = BlocProvider.of<PassengerBloc>(context);

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
        title: const Text(
          "Add Traveller",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
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
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal! * 2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Dubai',
                                    weight: FontWeight.bold,
                                    size: SizeConfig.screenWidth! * 0.045,
                                  ),
                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.2,),
                                  Icon(Icons.arrow_forward,color: Colors.black87,),
                                  SizedBox(width: SizeConfig.blockSizeHorizontal!*1.2,),
                                  CustomText(
                                    text: 'Bombay',
                                    weight: FontWeight.bold,
                                    size: SizeConfig.screenWidth! * 0.045,
                                  )
                                ],
                              ),
                              SizedBox(height:SizeConfig.blockSizeVertical!*1),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: '20 Mar 2023',
                                      weight: FontWeight.bold,
                                      color: textgrey,
                                      size: SizeConfig.screenWidth! * tiny_text,
                                    ),
                                    SizedBox(width: SizeConfig.blockSizeHorizontal!*0.5,),
                                    VerticalDivider(thickness: 1,color: greyline,),
                                    SizedBox(width: SizeConfig.blockSizeHorizontal!*0.5,),
                                    CustomText(
                                      text: '1 Traveller(s)',
                                      weight: FontWeight.bold,
                                      color: textgrey,
                                      size: SizeConfig.screenWidth! * tiny_text,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          PopupFareDetails(context,widget.HSRes);
                        },
                        child: CustomText(text: "View Details",
                          color: primary_blue,
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth!*small_text,textAlign: TextAlign.center),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical! * 1.2,
                    horizontal: SizeConfig.blockSizeHorizontal! * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: "Traveller Details",color: textgrey,size: SizeConfig.screenWidth!*medium_text,weight: FontWeight.bold,),
                    SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex:1,child: Row(
                          children: [
                            Container(
                              width:
                              SizeConfig.blockSizeHorizontal! * 8,
                              height:
                              SizeConfig.blockSizeVertical! * 8,
                              padding: EdgeInsets.all(7),
                              child: SvgPicture.asset(
                                'assets/images/profile.svg',
                                width: 10.0,
                                height: 10.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFDDF4FE),
                              ),
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                            CustomText(text: 'ADULT (12 yrs+)',size: SizeConfig.screenWidth!*small_text,weight: FontWeight.bold,color: Colors.black87,)
                          ],
                        )),
                        Expanded(flex:1,child: Row(
                          children: [
                            CustomText(text: "0/1",size: SizeConfig.blockSizeHorizontal!*medium_text,color: Colors.black87,),
                            SizedBox(width: SizeConfig.blockSizeHorizontal!*0.5,),
                            CustomText(text: "Added",size: SizeConfig.blockSizeHorizontal!*medium_text,color: Colors.red,),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //FareDetails PopUp
  PopupFareDetails(context,HostCheckRS HSRes) {

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
                       child: ListView(
                         scrollDirection: Axis.vertical,
                         children: [
                           Column(
                             children: [
                               Padding(
                                 padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal!*2),
                                 child: Container(
                                   height: SizeConfig.blockSizeVertical!*10,
                                   decoration: BoxDecoration(
                                     gradient: LinearGradient(
                                         colors: [
                                           const Color(0xFF0154BC),
                                           const Color(0xFF2899E0),
                                         ],
                                         begin: const FractionalOffset(0.0, 1.0),
                                         end: const FractionalOffset(0.0, 0.0),
                                         stops: [0.0, 1.0],
                                         tileMode: TileMode.clamp),
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(20),
                                         topLeft: Radius.circular(20)
                                     ),
                                   ),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           CustomText(text: "DXB",color: Colors.white, weight: FontWeight.bold,size: SizeConfig.screenWidth!*large_text,),
                                           SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                           Icon(Icons.arrow_forward,color: Colors.white,),
                                           SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                           CustomText(text: "BOM",color: Colors.white,weight: FontWeight.bold,size: SizeConfig.screenWidth!*large_text,)
                                         ],
                                       ),
                                       SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                                       IntrinsicHeight(
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             CustomText(text: "Non-Stop",color: Colors.white, weight: FontWeight.normal,size: SizeConfig.screenWidth!*small_text,),
                                             SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                             VerticalDivider(thickness: 1,color: Colors.white,),
                                             SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                             CustomText(text: "2h 50m",color: Colors.white,weight: FontWeight.normal,size: SizeConfig.screenWidth!*small_text,),
                                             SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                             VerticalDivider(thickness: 1,color: Colors.white,),
                                             SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                                             CustomText(text: "Economy",color: Colors.white,weight: FontWeight.normal,size: SizeConfig.screenWidth!*small_text,),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 height: SizeConfig.blockSizeVertical! * 0.1,
                               ),
                               ListView.builder(
                                   physics: const NeverScrollableScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount: 2,
                                   itemBuilder: (context, index) {
                                     //print('Printing the index--'+x.toString()+' '+AvailMain[index].flightsgrp![x].fare.toString());
                                     return Padding(
                                       padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal!*1),
                                       child: FlightDetailsCardAll(
                                         carrierCode: "SG",
                                         carriername: "Spice Jet",
                                         depTime: "06:25",
                                         depCity: "BOM",
                                         journeyHrs: Utilities.durationToString('600'),
                                         stops: "0",
                                         arrTime: "14:12",
                                         arrCity: "DXM",
                                         amount: "652",
                                         seatCount: "5",
                                         baggage: "30Kg",
                                         refund: 'N',
                                         flightno: "SG 562",
                                         depDateTime: "12 Mar 2023 23:05",
                                         arrDateTime: "13 Mar 2023 23:05",
                                         flytime: "150",
                                       ),
                                     );
                                   }),
                               SizedBox(
                                 height: SizeConfig.blockSizeVertical! * 1,
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*1.5),
                                 child: Card(
                                   elevation: 1,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0),
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
                                                 text: 'Fare Rule',
                                                 weight: FontWeight.bold,
                                                 color: Colors.black87,
                                                 size: SizeConfig.screenWidth! * large_text,
                                               ),
                                             )),
                                         Expanded(
                                           flex: 1,
                                           child: IconButton(
                                             onPressed: () {

                                             },
                                             icon: Icon(
                                               Icons.arrow_forward_ios_rounded,
                                               color: textgrey,
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 height: SizeConfig.blockSizeVertical! * 0.5,
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*1.5),
                                 child: Card(
                                   elevation: 1,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0),
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
                                                 text: 'Fare Brakeup',
                                                 weight: FontWeight.bold,
                                                 color: Colors.black87,
                                                 size: SizeConfig.screenWidth! * large_text,
                                               ),
                                             )),
                                         Expanded(
                                           flex: 1,
                                           child: IconButton(
                                             onPressed: () {

                                             },
                                             icon: Icon(
                                               Icons.arrow_forward_ios_rounded,
                                               color: textgrey,
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           )
                         ],
                       ),
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
                                      CustomText(text: 'AED '+ "444",weight: FontWeight.bold,size: SizeConfig.screenWidth!*large_text_extra,color: Colors.white,),
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


