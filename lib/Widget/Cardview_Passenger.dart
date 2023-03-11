import 'package:deira_flutter/Helper/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helper/Colors.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class PassengerCard extends StatelessWidget {

  final String? Title;
  final String? FirstName;
  final String? LastName;

  const PassengerCard({Key? key,this.Title,this.FirstName,this.LastName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*2.0,horizontal: SizeConfig.blockSizeHorizontal!*2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person,color: Colors.blueGrey,),
                SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
                CustomText(text: Title,weight: FontWeight.bold,color: textgrey,),
                SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                CustomText(text: FirstName,weight: FontWeight.bold,color: textgrey,),
                SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
                CustomText(text: LastName,weight: FontWeight.bold,color: textgrey),
                Spacer(),
                Icon(Icons.edit_note_rounded,color: Colors.blueGrey,),
              ],
            ),
          )),
    );
  }

}





