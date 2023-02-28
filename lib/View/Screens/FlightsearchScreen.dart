import 'package:deira_flutter/Helper/utilities.dart';
import 'package:deira_flutter/View/Screens/calendarScreen.dart';
import 'package:deira_flutter/View/bloc/flightSearchbloc/flight_search_bloc.dart';
import 'package:deira_flutter/View/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import '../../router.dart';
import '../widgets/customtext.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

import 'DummyOneway.dart';

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

  int adult = 1;
  int children = 0;
  int infant = 0;
  String type = "economy";
  String typetxt = "Economy";
  String tripType = "O";
  late String current_date;




  bottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Travellers & Class',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.clear))
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                      Divider(
                        color: Colors.black12,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Adults',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                              SizedBox(height: 7,),
                              Text('Above 12 years',style: TextStyle(color: Colors.black54,fontSize: 14,),),
                            ],
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal!*40,
                            height: SizeConfig.blockSizeVertical!*5.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(icon: Icon(Icons.clear,size: 20,),onPressed: (){
                                  if(adult > 1){
                                    setState(() {
                                      adult--;
                                      infant = 0;
                                      children = 0;
                                    });
                                  }
                                },),
                                Text('${adult}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                                IconButton(icon: Icon(Icons.add,size: 20,),onPressed: (){
                                  if(adult < 9){
                                    setState(() {
                                      adult++;
                                      infant = 0;
                                      children = 0;
                                    });
                                  }
                                },),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Children',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                              SizedBox(height: 7,),
                              Text('2-12 years',style: TextStyle(color: Colors.black54,fontSize: 14,),),
                            ],
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal!*40,
                            height: SizeConfig.blockSizeVertical!*5.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(icon: Icon(Icons.clear,size: 20,),onPressed: (){
                                  if(children != 0){
                                    setState(() {
                                      children--;
                                    });
                                  }
                                },),
                                Text('${children}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                                IconButton(icon: Icon(Icons.add,size: 20,),onPressed: (){

                                  if (adult + children < 9) {
                                    setState(() {
                                      children++;
                                    });
                                  }

                                },),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Infant',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                              SizedBox(height: 7,),
                              Text('0-23 Months',style: TextStyle(color: Colors.black54,fontSize: 14,),),
                            ],
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal!*40,
                            height: SizeConfig.blockSizeVertical!*5.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(icon: Icon(Icons.clear,size: 20,),onPressed: (){
                                  if(infant != 0){
                                    setState(() {
                                      infant--;
                                    });
                                  }
                                },),
                                Text('${infant}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                                IconButton(icon: Icon(Icons.add,size: 20,),onPressed: (){

                                    if ((infant < adult) && (infant < 4)) {
                                      setState(() {
                                        infant++;
                                      });
                                    }

                                },),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                type = "economy";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: type == "economy" ? secondary_blue : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: type == "economy" ? Colors.transparent : Colors.grey,width: 0.5),),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                child: Center(
                                  child: Text('Economy',
                                      style: TextStyle(fontSize: 14.0, color:  type == "economy" ? Colors.white : Colors.grey)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                type = "preeconomy";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: type == "preeconomy" ? secondary_blue : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: type == "preeconomy" ? Colors.transparent : Colors.grey,width: 0.5),),
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                child: Center(
                                  child: Text('Premimum Economy',
                                      style: TextStyle(fontSize: 14.0, color:  type == "preeconomy" ? Colors.white : Colors.grey)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                type = "business";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: type == "business" ? secondary_blue : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: type == "business" ? Colors.transparent : Colors.grey,width: 0.5),),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                child: Center(
                                  child: Text('Business',
                                      style: TextStyle(fontSize: 14.0, color:  type == "business" ? Colors.white : Colors.grey)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Center(
                        child: MaterialButton(
                          elevation: 2,
                          minWidth: SizeConfig.blockSizeHorizontal!*35,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          height: 50,
                          color: primary_blue,
                          child: Text('DONE',
                              style: TextStyle(fontSize: 16.0, color: Colors.white)),
                          onPressed: () {
                            bloc.adulttxt = adult;
                            bloc.childrentxt = children;
                            bloc.infanttxt = infant;
                            typetxt = (type == "economy") ? "Economy" : (type == "preeconomy") ? "Premimum Economy" : "Business";
                            bloc.add(PassengerRefreshEvent());
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                    ],
                  ),
                ),
              );
            } ,
          );
        }
    );
  }

  dialogBox_Preference(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //
                  insetPadding: EdgeInsets.all(15),// this right here
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                        Text('Airlines Filter',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                        Center(
                          child: SizedBox(
                            width: SizeConfig.blockSizeHorizontal!*50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                hintText: 'Code or Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              elevation: 2,
                              minWidth: SizeConfig.blockSizeHorizontal!*35,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              color: primary_blue_lte,
                              child: Text('Cancel',
                                  style: TextStyle(fontSize: 16.0, color: primary_blue)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            MaterialButton(
                              elevation: 2,
                              minWidth: SizeConfig.blockSizeHorizontal!*35,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              color: primary_blue,
                              child: Text('Apply',
                                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,)
                      ],
                    ),
                  ),
                );
              }
          );
        });
  }

  CitySelectWarning(String warnMsg){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //
                  insetPadding: EdgeInsets.all(15),// this right here
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                        Text('Warning',style: TextStyle(color: primary_blue,fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                        Center(
                          child: SizedBox(
                            width: SizeConfig.blockSizeHorizontal!*50,
                            child: CustomText(text: '${warnMsg}',textAlign: TextAlign.center,size: 18,),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              elevation: 2,
                              minWidth: SizeConfig.blockSizeHorizontal!*35,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              color: primary_blue_lte,
                              child: Text('CANCEL',
                                  style: TextStyle(fontSize: 16.0, color: primary_blue)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            MaterialButton(
                              elevation: 2,
                              minWidth: SizeConfig.blockSizeHorizontal!*35,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              color: primary_blue,
                              child: Text('OK',
                                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,)
                      ],
                    ),
                  ),
                );
              }
          );
        });
  }

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<FlightSearchBloc>(context);

    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyyMMdd');
    var fullformatter = new DateFormat('EEE, d MMM yyyy');

    current_date = formatter.format(now);
    bloc.fullfromDate = fullformatter.format(now);

    print(current_date); // 2016-01-25

    bloc.fromDate = current_date;

    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );

    print(Utilities.dateconversion('EEE, d MMM yyyy',current_date)); // 2016-01-25

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

          if(state is PassengerRefreshState){
            setState(() {

            });
          }
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
                                          tripType = "R";
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
                                      onTap: () async {
                                       var result = await Navigator.pushNamed(context, AppRoutes.citysearch);
                                       if(result != null){
                                         print(result);
                                         var parts = result.toString().split('~');
                                         setState(() {
                                           bloc.fromCityCode = parts[0].trim();
                                           bloc.fromCityName = parts[1].trim();
                                         });
                                       }
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
                                                  text: "${bloc.fromCityCode}",
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
                                                  text: "${bloc.fromCityName}",
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
                                    child: GestureDetector(
                                      onTap: () async {
                                        var result = await Navigator.pushNamed(context, AppRoutes.citysearch);
                                        if(result != null){
                                          print(result);
                                          var parts = result.toString().split('~');
                                          setState(() {
                                            bloc.toCityCode = parts[0].trim();
                                            bloc.toCityName = parts[1].trim();
                                          });
                                        }
                                      },
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
                                                  text: "${bloc.toCityCode}",
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
                                                  text: "${bloc.toCityName}",
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
                                  onTap: () async {

                                    // Navigator.pushNamed(context, AppRoutes.calendarflight);
                                    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarScreen(type: "oneway",)));
                                    if(result != null){
                                      print(result);
                                      var parts = result.toString().split('~');
                                      setState(() {
                                        bloc.fromDate = parts[0].trim();
                                        bloc.fullfromDate = parts[1].trim();
                                      });
                                    }
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
                                          text: bloc.fullfromDate,
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
                          InkWell(
                            onTap: (){
                              bottomSheet();
                            },
                            child: Row(
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
                                                text: "${bloc.adulttxt}",
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
                                                text: "${bloc.childrentxt}",
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
                                                text: "${bloc.infanttxt}",
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
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    bottomSheet();
                                  },
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
                                            text: "${typetxt}",
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
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    dialogBox_Preference();
                                  },
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
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                              onPressed: () async {

                                if(bloc.fromCityCode == "No City" && bloc.toCityCode == "No City"){
                                  CitySelectWarning('Please select Orgin and Destination City');
                                } else if(bloc.fromCityCode == "No City"){
                                  CitySelectWarning('Please select Orgin City');
                                }else if(bloc.toCityCode == "No City"){
                                  CitySelectWarning('Please select Destination City');
                                }else{

                                  final SharedPreferences prefs = await SharedPreferences.getInstance();

                                  prefs.setString("FromCode",bloc.fromCityCode);
                                  prefs.setString("ToCode",bloc.toCityCode);
                                  prefs.setString("FromCity",bloc.fromCityName);
                                  prefs.setString("ToCity",bloc.toCityName);
                                  prefs.setString("AdtCount",adult.toString());
                                  prefs.setString("ChdCount",children.toString());
                                  prefs.setString("InfCount",infant.toString());
                                  prefs.setString("TripType",tripType);
                                  prefs.setString("FromDate",bloc.fromDate);
                                  prefs.setString("Class","E");

                                  Navigator.pushNamed(context, AppRoutes.oneway);
                                }

                                // Navigator.pushNamed(context, AppRoutes.oneway);

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
