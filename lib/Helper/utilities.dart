import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';



import 'package:intl/intl.dart';


const double defaultPadding = 16.0;

const double gapTextFieldToText = 20.0;
const double gapTextToTextField = 8.0;



class Utilities {

  static String noDataMsg(String moduleName) {
    return 'No $moduleName Found';
  }

  static String moneyFormatter(double amount) {
    var formatter = NumberFormat("#,##,##0.00");
    String formatAmount = formatter.format(amount);
    return formatAmount;
  }

  static showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static showToastLong(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}



