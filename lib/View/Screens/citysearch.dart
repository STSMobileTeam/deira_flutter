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
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical!*8,
                color: primary_blue,
                child: Container(
                  color: primary_blue,
                  height: SizeConfig.blockSizeVertical!*2,
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*1,horizontal: SizeConfig.blockSizeHorizontal!*1),
                  child: Row(

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
