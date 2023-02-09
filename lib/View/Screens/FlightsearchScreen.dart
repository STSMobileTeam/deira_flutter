import 'package:deira_flutter/View/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import '../widgets/customtext.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Container(
              height: SizeConfig.blockSizeHorizontal! * 19,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex:1,
                      child: Container(
                        height: SizeConfig.blockSizeHorizontal! * 15,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: primary_blue,
                    ),
                        child: Center(child: CustomText(text: 'One Way', size: 18, weight: FontWeight.w500, color: Colors.white,)),
                  )),
                  Expanded(flex:1,
                      child: Container(
                        height: SizeConfig.blockSizeHorizontal! * 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(child: CustomText(text: 'Round Trip', size: 18, weight: FontWeight.w500, color: Colors.black87,)),
                      )),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: SizeConfig.blockSizeHorizontal! * 22,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "From",size: 16,color: textgrey),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                            CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                            CustomText(text: "Bombay",size: 16,color: textgrey),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: SizeConfig.blockSizeHorizontal! * 22,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: "From",size: 16,color: textgrey),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                            CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                            SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                            CustomText(text: "Bombay",size: 16,color: textgrey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  left: SizeConfig.blockSizeHorizontal!*42,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(
                      'assets/images/left_right_arrow.svg',
                      width: 10,
                      height: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.blockSizeHorizontal! * 22,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: greyline,
                            blurRadius: 0.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "From",size: 16,color: textgrey),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "Bombay",size: 16,color: textgrey),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.blockSizeHorizontal! * 22,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(text: "From",size: 16,color: textgrey),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "Bombay",size: 16,color: textgrey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.blockSizeHorizontal! * 22,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "From",size: 16,color: textgrey),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "Bombay",size: 16,color: textgrey),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.blockSizeHorizontal! * 22,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(text: "From",size: 16,color: textgrey),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "BOM",size: 22,weight: FontWeight.bold,color: Colors.black87),
                        SizedBox(height: SizeConfig.blockSizeVertical!*0.5,),
                        CustomText(text: "Bombay",size: 16,color: textgrey),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          ],
        ),
      ),
    );
  }
}
