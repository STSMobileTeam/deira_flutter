import 'package:flutter/material.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';

class SSRScreen extends StatefulWidget {
  const SSRScreen({Key? key}) : super(key: key);

  @override
  State<SSRScreen> createState() => _SSRScreenState();
}

class _SSRScreenState extends State<SSRScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: smokewhite,
      appBar: AppBar(
        backgroundColor: primary_blue,
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: const Text(
          "Create Passenger",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Column(

      ),
    );
  }
}
