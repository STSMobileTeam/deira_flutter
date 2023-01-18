import 'package:flutter/material.dart';

import '../../Helper/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  ),
            ),
            Expanded(
              flex: 1,
              child: Container()
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
