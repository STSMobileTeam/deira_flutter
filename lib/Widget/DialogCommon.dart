import 'package:flutter/material.dart';

import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class DialogCoomon extends StatefulWidget {
  const DialogCoomon({Key? key}) : super(key: key);

  @override
  State<DialogCoomon> createState() => _DialogCoomonState();
}

class _DialogCoomonState extends State<DialogCoomon> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal!*80,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomText(text: "Hi, Guest !",size: 20,weight: FontWeight.bold,textAlign: TextAlign.center,),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                      CustomText(text: 'Sign in or Create New Account to ',size: 16,textAlign: TextAlign.center,color: Colors.black54),
                      SizedBox(height: SizeConfig.blockSizeVertical!*4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () async {

                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff4DCBD6),
                                    Color(0xff506BD0),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                                alignment: Alignment.center,
                                width : SizeConfig.blockSizeVertical!*15,
                                padding: const EdgeInsets.all(15),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(15),
                            minWidth: SizeConfig.blockSizeVertical!*15,
                            elevation: 0,
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 18,
                                  color: Colors.black),
                            ),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () async {

                            },
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*3,),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 5.0,top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
