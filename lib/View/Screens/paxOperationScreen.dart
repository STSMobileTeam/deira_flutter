import 'package:deira_flutter/Helper/utilities.dart';
import 'package:deira_flutter/Models/PaxModel.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:flutter/material.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';
import '../widgets/customtextfield.dart';

class PaxOperationScreen extends StatefulWidget {
  String type ;

  PaxOperationScreen({Key? key,required this.type}) : super(key: key);

  @override
  State<PaxOperationScreen> createState() => _PaxOperationScreenState();
}

class _PaxOperationScreenState extends State<PaxOperationScreen> {

  String Gender="economy";

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
          "Create Passenger",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded( 
            child: Card(
              elevation: 2,
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical!*1.5,bottom: SizeConfig.blockSizeVertical!*3,left: SizeConfig.blockSizeHorizontal!*2.5,right: SizeConfig.blockSizeHorizontal!*2.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*0.8,horizontal: SizeConfig.blockSizeHorizontal!*2.5),
                          child: CustomText(text: "Adult 1",color: Colors.white,size: SizeConfig.screenWidth!*small_text,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: primary_blue,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                Gender = "mr";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Gender == "mr" ? primary_blue : Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                border: Border.all(color: Gender == "mr" ? Colors.transparent : primary_blue,width: 0.5),),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                child: Center(
                                  child: Text('Mr',
                                      style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Gender == "mr" ? Colors.white : primary_blue)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                Gender = "ms";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Gender == "ms" ? primary_blue : Colors.white,
                                borderRadius: BorderRadius.circular(0.0),
                                border: Border.all(color: Gender == "ms" ? Colors.transparent : primary_blue,width: 0.5),),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10 ),
                                child: Center(
                                  child: Text('Ms',
                                      style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Gender == "ms" ? Colors.white : primary_blue)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                Gender = "mrs";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Gender == "mrs" ? primary_blue : Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                border: Border.all(color: Gender == "mrs" ? Colors.transparent : primary_blue,width: 0.5),),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                                child: Center(
                                  child: Text('Mrs',
                                      style: TextStyle(fontSize: SizeConfig.screenWidth!*medium_text, color:  Gender == "mrs" ? Colors.white : primary_blue)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: TextField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  labelText: "First/Middle Name",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: SizeConfig.blockSizeVertical!*5.5,
                              child: TextField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderRadius:
                                    new BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                        color: textgrey),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "Date of birth",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          suffixIcon:Container(
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Align(alignment: Alignment.centerLeft,child: CustomText(text: "Passport Details",weight: FontWeight.bold,size: SizeConfig.screenWidth!*small_text)),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.8,),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "Nationality",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          suffixIcon:Container(
                            child: Icon(Icons.arrow_drop_down_sharp),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.8,),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "Passport Number",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          suffixIcon:Container(
                            child: Icon(Icons.flight),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.8,),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "Passport Expiry",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          suffixIcon:Container(
                            child: Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.8,),
                      TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "Issued Country",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            new BorderRadius.circular(
                                5.0),
                            borderSide: BorderSide(
                                color: textgrey),
                          ),
                          suffixIcon:Container(
                            child: Icon(Icons.arrow_drop_down_sharp),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                      Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          minWidth: SizeConfig.blockSizeHorizontal! * 100,
                          height: SizeConfig.blockSizeVertical! * 7,
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 14, bottom: 14),
                          child: const Text(
                            'SAVE',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          color: primary_blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onPressed: () {

                            PaxModel paxmodel = PaxModel(sNO: "1",paxRefNumber: "1",title: "Mr",firstName: "Abdul",lastName: "Wajeed",
                            age: "25",dOB: "05/08/1993",gender: "M",paxType: "ADT",passportNo: "565456454",passportExpiry: "05/05/2026",
                            placeOfBirth: "India",infantRef: "",isSelected: "T",issuedContry: "India");

                            Utilities.AdtPaxArrayList.add(paxmodel);

                            print(Utilities.AdtPaxArrayList);

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
