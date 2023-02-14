import 'package:flutter/material.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({Key? key}) : super(key: key);

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primary_blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical!*8,
              color: primary_blue,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*1.5,horizontal: SizeConfig.blockSizeHorizontal!*2.3),
              child: Container(
                color: Colors.white,
                height: SizeConfig.blockSizeVertical!*2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      color: Colors.black,
                      onPressed: () {

                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Container(
              color: Colors.white,
            ))
          ],
        ),
      ),
    );
  }
}
