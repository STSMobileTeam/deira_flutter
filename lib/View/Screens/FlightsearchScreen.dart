import 'package:deira_flutter/View/bloc/flightSearchbloc/flight_search_bloc.dart';
import 'package:deira_flutter/View/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import '../../router.dart';
import '../widgets/customtext.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen>
    with SingleTickerProviderStateMixin {
  bool showvalue = false;
  late AnimationController _controller;
  var tween = Tween<Offset>(begin: Offset.zero, end: Offset(-2, 0))
      .chain(CurveTween(curve: Curves.ease));
  late FlightSearchBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<FlightSearchBloc>(context);

    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Search Flight",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: BlocListener<FlightSearchBloc, FlightSearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<FlightSearchBloc, FlightSearchState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal! * 2,
                                vertical:
                                    SizeConfig.blockSizeHorizontal! * 1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: greyline),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: greyline,
                                    blurRadius: 0.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: bloc.roundtripshow ? GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          bloc.roundtripshow = false;
                                        });
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.blockSizeVertical! * 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                            child: CustomText(
                                          text: 'One Way',
                                          size: ScreenScale.convertFontSize(18,
                                              allowFontScaling: true),
                                          weight: FontWeight.w500,
                                          color: Colors.black87,
                                        )),
                                      ),
                                    ) :
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          bloc.roundtripshow = false;
                                        });
                                      },
                                      child: Container(
                                        height:
                                        SizeConfig.blockSizeVertical! * 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          color: primary_blue,
                                        ),
                                        child: Center(
                                            child: CustomText(
                                              text: 'One Way',
                                              size: ScreenScale.convertFontSize(18,
                                                  allowFontScaling: true),
                                              weight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: bloc.roundtripshow ? GestureDetector(
                                      onTap: (){
                                        print('RoundTrip-----');
                                        setState(() {
                                          bloc.roundtripshow = true;
                                        });
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.blockSizeVertical! * 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: primary_blue,
                                        ),
                                        child: Center(
                                            child: CustomText(
                                          text: 'Round Trip',
                                          size: ScreenScale.convertFontSize(18,
                                              allowFontScaling: true),
                                          weight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                      ),
                                    ) :
                                    GestureDetector(
                                      onTap: (){
                                        print('RoundTrip-----');
                                        setState(() {
                                          bloc.roundtripshow = true;
                                        });
                                      },
                                      child: Container(
                                        height:
                                        SizeConfig.blockSizeVertical! * 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                            child: CustomText(
                                              text: 'Round Trip',
                                              size: ScreenScale.convertFontSize(18,
                                                  allowFontScaling: true),
                                              weight: FontWeight.w500,
                                              color: Colors.black87,
                                            )),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, AppRoutes.citysearch);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal! *
                                                    2),
                                        child: Container(
                                          // height: SizeConfig.blockSizeVertical! * 11.7,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                              vertical:
                                                  SizeConfig.blockSizeVertical! *
                                                      1.3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(color: greyline),
                                              color: Colors.white,
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: greyline,
                                                  blurRadius: 0.0,
                                                  offset: Offset(0.0, 0.0),
                                                ),
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                  text: "From",
                                                  size:
                                                      ScreenScale.convertFontSize(
                                                          15,
                                                          allowFontScaling: true),
                                                  color: textgrey),
                                              SizedBox(
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    0.4,
                                              ),
                                              CustomText(
                                                  text: "BOM",
                                                  size:
                                                      ScreenScale.convertFontSize(
                                                          ScreenScale
                                                              .convertFontSize(
                                                                  22,
                                                                  allowFontScaling:
                                                                      true),
                                                          allowFontScaling: true),
                                                  weight: FontWeight.bold,
                                                  color: Colors.black87),
                                              SizedBox(
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    0.4,
                                              ),
                                              CustomText(
                                                  text: "Bombay",
                                                  size:
                                                      ScreenScale.convertFontSize(
                                                          18,
                                                          allowFontScaling: true),
                                                  color: textgrey),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              SizeConfig.blockSizeHorizontal! *
                                                  2),
                                      child: Container(
                                        // height: SizeConfig.blockSizeVertical! * 11.7,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
                                            vertical:
                                                SizeConfig.blockSizeVertical! *
                                                    1.3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(color: greyline),
                                            color: Colors.white,
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: greyline,
                                                blurRadius: 0.0,
                                                offset: Offset(0.0, 0.0),
                                              ),
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomText(
                                                text: "To",
                                                size:
                                                    ScreenScale.convertFontSize(
                                                        15,
                                                        allowFontScaling: true),
                                                color: textgrey),
                                            SizedBox(
                                              height: SizeConfig
                                                      .blockSizeVertical! *
                                                  0.4,
                                            ),
                                            CustomText(
                                                text: "DEL",
                                                size:
                                                    ScreenScale.convertFontSize(
                                                        22,
                                                        allowFontScaling: true),
                                                weight: FontWeight.bold,
                                                color: Colors.black87),
                                            SizedBox(
                                              height: SizeConfig
                                                      .blockSizeVertical! *
                                                  0.4,
                                            ),
                                            CustomText(
                                                text: "Delhi",
                                                size:
                                                    ScreenScale.convertFontSize(
                                                        18,
                                                        allowFontScaling: true),
                                                color: textgrey),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(_controller),
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller..forward(from: 0.0);
                                    },
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 13,
                                      height:
                                          SizeConfig.blockSizeVertical! * 13,
                                      padding: EdgeInsets.all(5),
                                      child: SvgPicture.asset(
                                        'assets/images/left_right_arrow.svg',
                                        width: 10.0,
                                        height: 10.0,
                                        color: primary_blue,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(color: greyline),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.calendarflight);
                                  },
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical! * 10,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                        vertical:
                                            SizeConfig.blockSizeVertical! * 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(color: greyline),
                                        color: Colors.white,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: greyline,
                                            blurRadius: 0.0,
                                            offset: Offset(0.0, 0.0),
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: "Depature",
                                            size: SizeConfig.screenWidth!*0.035,
                                            color: textgrey),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical! * 0.7,
                                        ),
                                        CustomText(
                                          text: "Wed, 5 Feb 2023",
                                          size: SizeConfig.screenWidth!*0.05,
                                          color: Colors.black87,
                                          weight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: bloc.roundtripshow,
                                child: Expanded(
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical! * 10,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                        vertical:
                                        SizeConfig.blockSizeVertical! * 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(color: greyline),
                                        color: Colors.white,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: greyline,
                                            blurRadius: 0.0,
                                            offset: Offset(0.0, 0.0),
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: "Depature",
                                            size: SizeConfig.screenWidth!*0.035,
                                            color: textgrey),
                                        SizedBox(
                                          height:
                                          SizeConfig.blockSizeVertical! * 0.7,
                                        ),
                                        CustomText(
                                          text: "Wed, 8 Feb 2023",
                                          size: SizeConfig.screenWidth!*0.05,
                                          color: Colors.black87,
                                          weight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  height: SizeConfig.blockSizeVertical! * 10,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal! * 3,
                                      vertical:
                                          SizeConfig.blockSizeVertical! * 1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: greyline),
                                      color: Colors.white,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: greyline,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: "Passenger",
                                          size: ScreenScale.convertFontSize(16,
                                              allowFontScaling: true),
                                          color: textgrey),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical! * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                              text: "1",
                                              size: ScreenScale.convertFontSize(
                                                  20,
                                                  allowFontScaling: true),
                                              weight: FontWeight.bold,
                                              color: Colors.black87),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          ),
                                          CustomText(
                                              text: "Adult (s)",
                                              size: ScreenScale.convertFontSize(
                                                  18,
                                                  allowFontScaling: true),
                                              weight: FontWeight.normal,
                                              color: textgrey),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.5,
                                          ),
                                          CustomText(
                                              text: "0",
                                              size: ScreenScale.convertFontSize(
                                                  20,
                                                  allowFontScaling: true),
                                              weight: FontWeight.bold,
                                              color: Colors.black87),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          ),
                                          CustomText(
                                              text: "Child (s)",
                                              size: ScreenScale.convertFontSize(
                                                  18,
                                                  allowFontScaling: true),
                                              weight: FontWeight.normal,
                                              color: textgrey),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.5,
                                          ),
                                          CustomText(
                                              text: "0",
                                              size: ScreenScale.convertFontSize(
                                                  20,
                                                  allowFontScaling: true),
                                              weight: FontWeight.bold,
                                              color: Colors.black87),
                                          SizedBox(
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          ),
                                          CustomText(
                                              text: "Infant (s)",
                                              size: ScreenScale.convertFontSize(
                                                  18,
                                                  allowFontScaling: true),
                                              weight: FontWeight.normal,
                                              color: textgrey),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal! *
                                          1.6),
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical! * 10,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                        vertical:
                                            SizeConfig.blockSizeVertical! * 1),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(color: greyline),
                                        color: Colors.white,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: greyline,
                                            blurRadius: 0.0,
                                            offset: Offset(0.0, 0.0),
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: "Passenger",
                                            size: ScreenScale.convertFontSize(
                                                16,
                                                allowFontScaling: true),
                                            color: textgrey),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical! * 1,
                                        ),
                                        CustomText(
                                          text: "Economy",
                                          size: ScreenScale.convertFontSize(18,
                                              allowFontScaling: true),
                                          color: Colors.black,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal! *
                                          1.6),
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical! * 10,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                        vertical:
                                            SizeConfig.blockSizeVertical! * 1),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(color: greyline),
                                        color: Colors.white,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: greyline,
                                            blurRadius: 0.0,
                                            offset: Offset(0.0, 0.0),
                                          ),
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: "Preffered Airline",
                                            size: ScreenScale.convertFontSize(
                                                16,
                                                allowFontScaling: true),
                                            color: textgrey),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical! * 1,
                                        ),
                                        CustomText(
                                          text: "Select Airline",
                                          size: ScreenScale.convertFontSize(18,
                                              allowFontScaling: true),
                                          color: Colors.black,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: !showvalue,
                                onChanged: (value) {
                                  if (value! == true) {
                                    setState(() {
                                      showvalue = false;
                                    });
                                  } else {
                                    setState(() {
                                      showvalue = true;
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 2,
                              ),
                              CustomText(
                                text: "Direct flight",
                                size: ScreenScale.convertFontSize(16,
                                    allowFontScaling: true),
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              minWidth: SizeConfig.blockSizeHorizontal! * 80,
                              height: SizeConfig.blockSizeVertical! * 7,
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 14, bottom: 14),
                              child: const Text(
                                'SEARCH FLIGHT',
                                style: TextStyle(fontSize: 20),
                              ),
                              color: primary_blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.oneway);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: smokewhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/flight_search.svg',
                                  width: SizeConfig.blockSizeHorizontal! * 3,
                                  height: SizeConfig.blockSizeVertical! * 3,
                                  color: primary_blue,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                CustomText(
                                  text: "Search",
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ticket.svg',
                                  width: SizeConfig.blockSizeHorizontal! * 3,
                                  height: SizeConfig.blockSizeVertical! * 3,
                                  color: greyash,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                CustomText(
                                  text: "Upcoming Trips",
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/flight_search.svg',
                                  width: SizeConfig.blockSizeHorizontal! * 3,
                                  height: SizeConfig.blockSizeVertical! * 3,
                                  color: greyash,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                CustomText(
                                  text: "My Booking",
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }

  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {
        showvalue = checkBoxState;
      });
    }
  }
}
