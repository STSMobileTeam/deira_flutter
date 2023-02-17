import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Helper/Colors.dart';

class OnewayScreen extends StatefulWidget {
  const OnewayScreen({Key? key}) : super(key: key);

  @override
  State<OnewayScreen> createState() => _OnewayScreenState();
}

class _OnewayScreenState extends State<OnewayScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: primary_blue, // Note RED here
      ),
    );
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body:SafeArea(
          child: Column(
            children: [
              Container(
                color: primary_blue,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      }, icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          ),
        )
        ),
    );
  }
}
