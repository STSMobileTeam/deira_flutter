import 'package:deira_flutter/Helper/utilities.dart';
import 'package:deira_flutter/Models/HostCheck.dart';
import 'package:flutter/material.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';
import '../router.dart';

class DialogCoomon extends StatefulWidget {

  String title,Message;
  HostCheckRS hstres;


  DialogCoomon({Key? key,required this.title,required this.Message,required this.hstres}) : super(key: key);

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
                      SizedBox(height: SizeConfig.blockSizeVertical!*1.5,),
                      CustomText(text: widget.title,size: SizeConfig.screenWidth!*medium_text,weight: FontWeight.bold,textAlign: TextAlign.center,color: Colors.black54,),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2.5,),
                      CustomText(text: Utilities.HTMLremover(widget.Message), size: SizeConfig.screenWidth!*medium_text,textAlign: TextAlign.center,weight: FontWeight.bold,color: Colors.black87),
                      SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal!*3),
                            minWidth: SizeConfig.blockSizeVertical!*15,
                            elevation: 0,
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: SizeConfig.screenWidth!*small_text,
                                  color: Colors.black),
                            ),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                          MaterialButton(
                            onPressed: () async {

                              Navigator.pop(context);

                              Navigator.pushNamed(context, AppRoutes.passenger,arguments: widget.hstres);

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
                                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal!*3),
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: SizeConfig.screenWidth!*small_text),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
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
