import 'dart:ffi';

import 'package:deira_flutter/Models/PaxModel.dart';
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

  static List<PaxModel> AdtPaxArrayList = [];
  static List<PaxModel> ChdPaxArrayList = [];
  static List<PaxModel> InfPaxArrayList = [];


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
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static String cityname(String text) {
    if(text.contains("(")) {
      String subStrAirNam = text.substring(0, text.indexOf("("));
      return subStrAirNam;
    }else{
      return text;
    }
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

  static double Actual_fare_Avail(int Adt, int Chd, int Inf, String F_Fare, String PaxType) {
    double Fare = 0.0;

    double var1 = 0.0, var2 = 0.0, var3 = 0.0;

    String Fare_1, Fare_2, Fare_3;


      List<String> separated = F_Fare.split("|");

      if (separated.length == 1) {

        Fare_1 = (separated[0]);

        //Adult

        Fare = Adt * double.parse(Fare_1);

      } else if (separated.length == 2) {

        Fare_1 = (separated[0]);
        Fare_2 = (separated[1]);

        var1 = Adt * double.parse(Fare_1);

        if (PaxType.contains("CHD")) {
          var2 = Chd * double.parse(Fare_2);
        } else if (PaxType.contains("INF")) {
          var2 = Inf * double.parse(Fare_2);
        }

        Fare = var1 + var2;

      }
      if (separated.length == 3) {

        Fare_1 = (separated[0]);
        Fare_2 = (separated[1]);
        Fare_3 = (separated[2]);

        var1 = Adt * double.parse(Fare_1);
        var2 = Chd * double.parse(Fare_2);
        var3 = Inf * double.parse(Fare_3);

        Fare = var1 + var2 + var3;

      }


    return Fare;
  }

  static double Actual_fare_Avail_(int Adt, int Chd, int Inf, String F_Fare, String PaxType) {
    double Fare = 0.0;

    double var1 = 0.0, var2 = 0.0, var3 = 0.0;

    String Fare_1, Fare_2, Fare_3;


    List<String> separated = F_Fare.split("|");

    if (separated.length == 1) {

      Fare_1 = (separated[0]);

      //Adult

      Fare = Adt * double.parse(Fare_1)/Adt;

    } else if (separated.length == 2) {

      Fare_1 = (separated[0]);
      Fare_2 = (separated[1]);

      var1 = Adt * double.parse(Fare_1)/Adt;

      if (PaxType.contains("CHD")) {
        var2 = Chd * double.parse(Fare_2)/Chd;
      } else if (PaxType.contains("INF")) {
        var2 = Inf * double.parse(Fare_2)/Inf;
      }

      Fare = var1 + var2;

    }
    if (separated.length == 3) {

      Fare_1 = (separated[0]);
      Fare_2 = (separated[1]);
      Fare_3 = (separated[2]);

      var1 = Adt * double.parse(Fare_1)/Adt;
      var2 = Chd * double.parse(Fare_2)/Chd;
      var3 = Inf * double.parse(Fare_3)/Inf;

      Fare = var1 + var2 + var3;

    }


    return Fare;
  }


  static String durationToString(String? minutes) {
    var K = int.parse(minutes!);
    var d = Duration(minutes:K);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
  }


  static String terminals(String text) {

    if(text.contains("-")) {
      String textension = text.substring(text.lastIndexOf("-") + 1);
      return textension;
    }else{
      return text;
    }

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

// public static double Actual_fare_Avail(int Adt, int Chd, int Inf, String F_Fare, String PaxType) {
//   double Fare = 0.0;

//   double var1 = 0.0, var2 = 0.0, var3 = 0.0;

//   String Fare_1, Fare_2, Fare_3;

//   try {

//     String[] separated = F_Fare.split("\\|");

//     if (separated.length == 1) {

//       Fare_1 = (separated[0]);

//       //Adult

//       Fare = Adt * Double.parseDouble(Fare_1);

//     } else if (separated.length == 2) {

//       Fare_1 = (separated[0]);
//       Fare_2 = (separated[1]);

//       var1 = Adt * Double.parseDouble(Fare_1);

//       if (PaxType.contains("CHD")) {
//         var2 = Chd * Double.parseDouble(Fare_2);
//       } else if (PaxType.contains("INF")) {
//         var2 = Inf * Double.parseDouble(Fare_2);
//       }

//       Fare = var1 + var2;

//     }
//     if (separated.length == 3) {

//       Fare_1 = (separated[0]);
//       Fare_2 = (separated[1]);
//       Fare_3 = (separated[2]);

//       var1 = Adt * Double.parseDouble(Fare_1);
//       var2 = Chd * Double.parseDouble(Fare_2);
//       var3 = Inf * Double.parseDouble(Fare_3);

//       Fare = var1 + var2 + var3;

//     }


//   } catch (Exception e) {
//   Log.e(TAG, "-EXE-" + e);
//   }

//   return Fare;
// }



class ConstantVariableClass {
  static String noResultString = 'Not added';

  static String loadingString = 'Loading';

  static bool dashboardScreenBoolean = false;

  var familyHeadScrollBoolean = ValueNotifier<bool>(true);
}




