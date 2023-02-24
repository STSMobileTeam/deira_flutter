import 'package:deira_flutter/Helper/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helper/Colors.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class FareCardAvail extends StatelessWidget {

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

  const FareCardAvail({Key? key,this.carriername,this.depTime,this.depCity,
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
                Row(
                  children: [
                    Expanded(flex:1,child: Row(
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical!*3.2,
                          width: SizeConfig.blockSizeHorizontal!*7.4,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.cyan ,
                          ),
                          child: Center(child: CustomText(text: refund,color: Colors.white,size: SizeConfig.screenWidth!*0.035,weight: FontWeight.bold,)),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal!*1.5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Normal Fare",size: SizeConfig.screenWidth!*medium_text,weight: FontWeight.w800,color: Colors.black87,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                            CustomText(text: "Fare offered by Airline",size: SizeConfig.screenWidth!*small_text,weight: FontWeight.normal,color: Colors.black87,),
                          ],
                        )
                      ],
                    )),
                    Expanded(flex:1,child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(text: 'AED '+amount!,size: SizeConfig.screenWidth!*medium_text,color: Colors.black87,weight: FontWeight.bold,),
                        SizedBox(width: SizeConfig.blockSizeHorizontal!*0.01,),
                        Radio(
                            value: "",
                            groupValue: "",
                            onChanged: (value){
                              print(value); //selected value
                            }
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*2.3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex:1,
                        child: Container()),
                    Expanded(flex:1,
                        child: Container()),
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



