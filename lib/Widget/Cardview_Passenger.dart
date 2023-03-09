import 'package:deira_flutter/Helper/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helper/Colors.dart';
import '../Helper/size_config.dart';
import '../View/widgets/customtext.dart';

class PassengerCard extends StatelessWidget {

  final String? Name;

  const PassengerCard({Key? key,this.Name}) : super(key: key);

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
                CustomText(text: Name,)
              ],
            ),
          )),
    );
  }

}





