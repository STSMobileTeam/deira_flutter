import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/size_config.dart';
import '../../router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  _movetonextscreen() async {
    await Future.delayed(Duration(seconds: 5));
     Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
  }

  @override
  void initState() {
    super.initState();

    _movetonextscreen();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child:Image(
                image: AssetImage('assets/images/splash.png'),
                  fit:BoxFit.cover
              ),
            ),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                'assets/images/logo_new.svg',
                width: 50.0,
                height: 50.0,
              )
            ),
            Expanded(
              flex: 1,
              child: Image(
                image: AssetImage('assets/images/splash_bottom.png'),
              ),
            ),
          ],
        )
    );
  }
}
