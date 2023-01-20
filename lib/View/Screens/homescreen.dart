import 'package:deira_flutter/Helper/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/size_config.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical!* 18,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: primary_blue,
                boxShadow: [
                  new BoxShadow(blurRadius: 2.0)
                ],
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 60.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom : SizeConfig.blockSizeVertical!*4),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/images/logo_white.svg',
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
