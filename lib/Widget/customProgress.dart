import 'package:flutter/material.dart';

class CutomProgress extends StatefulWidget {
  const CutomProgress({Key? key}) : super(key: key);

  @override
  State<CutomProgress> createState() => _CutomProgressState();
}

class _CutomProgressState extends State<CutomProgress> {

  var _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: _backgroundColor,
        child: Image.asset(
            'assets/images/logodeira.gif', // Put your gif into the assets folder
            width: 100,
            height: 100,
        ),
      ),
    );
  }
}
