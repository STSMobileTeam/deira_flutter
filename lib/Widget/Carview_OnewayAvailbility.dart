import 'package:deira_flutter/Helper/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helper/Colors.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class OnewayAvilCard extends StatelessWidget {

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


  const OnewayAvilCard({Key? key,this.carriername,this.depTime,this.depCity,
    this.carrierCode,this.journeyHrs,this.stops,this.arrTime,this.arrCity,this.seatCount,this.baggage,this.refund,this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Container(
          width: SizeConfig.blockSizeHorizontal! * 100,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18, right: 15, bottom: 15, top: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomText(text: carriername,color: Colors.black87,size: SizeConfig.screenWidth!*tiny_text,weight: FontWeight.bold,),
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex:1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInImage(
                              image: NetworkImage('https://imgak.goibibo.com/flights-gi-assets/images/v2/app-img/'+carrierCode!+'.png'),
                              width: 30,
                              height: 30,
                              fit: BoxFit.fill,
                              placeholder: AssetImage(
                                  'assets/images/fly_ph.png')),
                        ],
                      ),),
                    Expanded(flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: depTime,weight: FontWeight.bold,color: textgrey,size: SizeConfig.screenWidth!*0.050,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.3,),
                            CustomText(text: depCity,weight: FontWeight.normal,color: Colors.black,size: SizeConfig.screenWidth!*0.035,),
                      ],
                    )),
                    Expanded(flex:3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(text: journeyHrs,weight: FontWeight.w600,color: Colors.black,size: SizeConfig.screenWidth!*0.033,),
                            SvgPicture.asset(
                              'assets/images/dotflightmobile_.svg',
                              width: SizeConfig.blockSizeHorizontal!*2,
                              height: SizeConfig.blockSizeVertical!*2,
                            ),
                            CustomText(text: stops,weight: FontWeight.normal,color: Colors.black,size: SizeConfig.screenWidth!*tiny_text,),
                          ],
                        )),
                    Expanded(flex:2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: arrTime,weight: FontWeight.bold,color: textgrey,size: SizeConfig.screenWidth!*0.050,),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.3,),
                            CustomText(text: arrCity,weight: FontWeight.normal,color: Colors.black,size: SizeConfig.screenWidth!*0.035,),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
                DotWidget(
                  dashColor: Colors.grey,
                  dashHeight: 0.5,
                  dashWidth: 3,
                  totalWidth: SizeConfig.blockSizeHorizontal!*90,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
                Row(
                  children: [
                    Expanded(flex:1, child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/seat.svg',
                          width: SizeConfig.blockSizeHorizontal!*2.3,
                          height: SizeConfig.blockSizeVertical!*2.3,
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal!*0.01,),
                        CustomText(text:seatCount,color: Colors.black,weight: FontWeight.bold,size: SizeConfig.screenWidth!*tiny_text,),

                        SizedBox(width: SizeConfig.blockSizeHorizontal!*2.1,),

                        SvgPicture.asset(
                          'assets/images/baggage.svg',
                          width: SizeConfig.blockSizeHorizontal!*1.8,
                          height: SizeConfig.blockSizeVertical!*1.8,
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal!*1.2,),
                        CustomText(text: baggage,color: Colors.black,weight: FontWeight.bold,size: SizeConfig.screenWidth!*tiny_text,),

                        SizedBox(width: SizeConfig.blockSizeHorizontal!*2.1,),

                        Container(
                          height: SizeConfig.blockSizeVertical!*2.2,
                          width: SizeConfig.blockSizeHorizontal!*5.2,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green ,
                          ),
                          child: Center(child: CustomText(text: refund,color: Colors.white,size: SizeConfig.screenWidth!*0.023,weight: FontWeight.bold,)),
                        ),

                      ],
                    )),
                    Expanded(flex:1, child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(text: "AED "+amount!,size: SizeConfig.screenWidth!*0.045,weight: FontWeight.bold,color: primary_blue,)
                      ],
                    ))
                  ],
                )
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



