import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';



const double defaultPadding = 16.0;

const double gapTextFieldToText = 20.0;
const double gapTextToTextField = 8.0;

const double small_text= 0.035;
const double medium_text= 0.04;
const double large_text= 0.045;
const double large_text_extra= 0.055;
const double tiny_text= 0.030;


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

  static String HTMLremover(String html){
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    String parsedstring1 = html.replaceAll(exp, '');
    print(parsedstring1);
//output without space:  HelloThis is fluttercampus.com,Bye!

    String parsedstring2 = html.replaceAll(exp, ' ');

    return parsedstring2;
  }

  static String dateconversion(String format, String Date) {

    DateTime dt1 = DateTime.parse(Date);

    var formatter = new DateFormat(format);

    String current_date = formatter.format(dt1);

    return current_date;

  }


  static String durationToString(String? minutes) {
    var K = int.parse(minutes!);
    var d = Duration(minutes:K);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
  }

  static String farename(String FareTyp, String FareTypeDESC) {
    String FareTypename = "";

    if (FareTyp.toUpperCase()==("C") && (FareTypeDESC.toUpperCase()==("C") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Corporate Fare";
    } else if (FareTyp.toUpperCase()==("R") && (FareTypeDESC.toUpperCase()==("R") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Retail Fare";
    } else if ((FareTyp.toUpperCase()==("U") || FareTyp.toUpperCase()==("I")) && (FareTypeDESC.toUpperCase()==("U") || FareTypeDESC.toUpperCase()==("I") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "SME Corporate Fare";
    } else if ((FareTyp.toUpperCase()==("V") || FareTyp.toUpperCase()==("J")) && (FareTypeDESC.toUpperCase()==("V") || FareTypeDESC.toUpperCase()==("J") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "SME Retail Fare";
    } else if (FareTyp.toUpperCase()==("E") && (FareTypeDESC.toUpperCase()==("E") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Coupon Fare";
    } else if (FareTyp.toUpperCase()==("S") && (FareTypeDESC.toUpperCase()==("S") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Special Fare";
    } else if (FareTyp.toUpperCase()==("L") && (FareTypeDESC.toUpperCase()==("L") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Labour Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("F")) {
      FareTypename = "Flexi Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("H")) {
      FareTypename = "Hand Baggage";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("M")) {
      FareTypename = "SME Fare";
    } else if (FareTyp.toUpperCase()==("P") || FareTyp.toUpperCase()==("W")) {
      FareTypename = "Flat Fare";
    } else if ((FareTyp.toUpperCase()==("Q") || FareTyp.toUpperCase()==("M")) && (FareTypeDESC.toUpperCase()==("Q") || FareTypeDESC.toUpperCase()==("M") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "SME Fare";
    } else if (FareTyp.toUpperCase()==("G") && (FareTypeDESC.toUpperCase()==("G") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Marine Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("A")) {
      FareTypename = "Normal Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("K")) {
      FareTypename = "GoMore Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("E")) {
      FareTypename = "Coupon Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("S")) {
      FareTypename = "Special Fare";
    } else if (FareTyp.toUpperCase()==("N") && FareTypeDESC.toUpperCase()==("D")) {
      FareTypename = "SpiceMax Fare";
    } else if (FareTyp.toUpperCase()==("D") && (FareTypeDESC.toUpperCase()==("D") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Defence Fare";
    } else if (FareTyp.toUpperCase()==("N") && (FareTypeDESC.toUpperCase()==("N") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Normal Fare";
    } else if (FareTyp.toUpperCase()==("A") && FareTypeDESC.toUpperCase()==("N")) {
      FareTypename = "Normal - Double Seat";
    } else if (FareTyp.toUpperCase()==("A") && FareTypeDESC.toUpperCase()==("F")) {
      FareTypename = "Flexi - Double Seat";
    } else if (FareTyp.toUpperCase()==("A") && (FareTypeDESC.toUpperCase()==("A") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Double Seat";
    } else if (FareTyp.toUpperCase()==("X") && (FareTypeDESC.toUpperCase()==("X") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Student Fare";
    } else if (FareTyp.toUpperCase()==("O") && (FareTypeDESC.toUpperCase()==("O") || FareTypeDESC==("null") || FareTypeDESC==(null) || FareTypeDESC.isEmpty)) {
      FareTypename = "Senior Citizen Fare";
    } else if (FareTypeDESC!=("")) {
      FareTypename = FareTypeDESC;
    } else if (FareTyp!=("")) {
      FareTypename = FareTyp.toUpperCase();
    }

    return FareTypename;
  }


}



class ConstantVariableClass {
  static String noResultString = 'Not added';

  static String loadingString = 'Loading';

  static bool dashboardScreenBoolean = false;

  var familyHeadScrollBoolean = ValueNotifier<bool>(true);
}




