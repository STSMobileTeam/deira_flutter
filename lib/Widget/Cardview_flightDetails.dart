import 'package:deira_flutter/Helper/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helper/Colors.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class FlightDetailsCard extends StatelessWidget {

  final String? carriername;
  final String? depTime;
  final String? depCity;
  final String? carrierCode;
  final String? journeyHrs;
  final String? stops;
  final String? arrTime;
  final String? arrCity;
  final String? seatCount;
  final String? baggage;
  final String? refund;
  final String? amount;
  final String? flightno;
  final String? depDateTime;
  final String? arrDateTime;
  final String? flytime;

  const FlightDetailsCard({Key? key,this.carriername,this.depTime,this.depCity,
    this.carrierCode,this.journeyHrs,this.stops,this.arrTime,this.arrCity,this.seatCount,this.baggage,
    this.refund,this.amount,this.flightno,this.depDateTime,this.arrDateTime,this.flytime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*2.0,horizontal: SizeConfig.blockSizeHorizontal!*2.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      FadeInImage(
                          image: NetworkImage('https://imgak.goibibo.com/flights-gi-assets/images/v2/app-img/'+carrierCode!+'.png'),
                          width: SizeConfig.blockSizeHorizontal!*7.3,
                          fit: BoxFit.fill,
                          placeholder: AssetImage(
                              'assets/images/fly_ph.png')),
                      SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                      CustomText(text: carriername,color: Colors.black87,size: SizeConfig.screenWidth!*medium_text,weight: FontWeight.bold,),
                      SizedBox(width: SizeConfig.blockSizeHorizontal!*0.5,),
                      VerticalDivider(
                        color: Colors.black87,
                        thickness: 0.5,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal!*0.5,),
                      CustomText(text: flightno,color: Colors.black87,size: SizeConfig.screenWidth!*medium_text,weight: FontWeight.bold,),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: depTime,weight: FontWeight.bold,color: Colors.black87,size: SizeConfig.screenWidth!*0.050,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.8,),
                            CustomText(text: depDateTime,weight: FontWeight.normal,color: textgrey,size: SizeConfig.screenWidth!*0.035,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.8,),
                            CustomText(text: depCity,weight: FontWeight.bold,color: textgrey,size: SizeConfig.screenWidth!*0.036,),
                          ],
                        )),
                    Expanded(flex:3,
                        child: Column(
                          children: [
                            CustomText(text: Utilities.durationToString(flytime),weight: FontWeight.bold,size: SizeConfig.screenWidth!*tiny_text,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.7,),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DotWidget(
                                  dashColor: Colors.grey,
                                  dashHeight: 0.5,
                                  dashWidth: 3,
                                  totalWidth: SizeConfig.blockSizeHorizontal!*30,
                                ),
                                Icon(Icons.access_time_filled_rounded,color: textgrey,size: SizeConfig.screenWidth!*0.06,)
                              ],
                            )
                          ],
                        )),
                    Expanded(flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(text: arrTime,weight: FontWeight.bold,color: Colors.black87,size: SizeConfig.screenWidth!*0.050,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.8,),
                            CustomText(text: arrDateTime,weight: FontWeight.normal,color: textgrey,size: SizeConfig.screenWidth!*0.035,textAlign: TextAlign.right,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.8,),
                            CustomText(text: arrCity,weight: FontWeight.bold,color: textgrey,size: SizeConfig.screenWidth!*0.035,),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
              ],
            ),
          )),
    );
  }

}

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
            (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}



