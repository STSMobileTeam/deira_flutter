import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

import 'package:intl/intl.dart';
import 'package:image/image.dart' as Im;

const double defaultPadding = 16.0;

const double gapTextFieldToText = 20.0;
const double gapTextToTextField = 8.0;

// const String defaultNumer = "defaultNumer";

const String inchargeApi = "inchargeApi";
const String inchargeByRegionApi = "inchargeByRegionApi";
const String regionApi = "regionApi";
const String programApi = "programApi";
const String subprogramApi = "subprogramApi";
const String subprogramRecurringApi = "subprogramRecurringApi";
const String familyMemApi = "familyMemApi";
const String accountApi = "accountApi";
const String accountFilterApi = "accountFilterApi";
const String accountMainAccApi = "accountMainAccApi";

const String editFamilyStateApi = "editFamilyStateApi";
const String sponsorApi = "sponsorApi";
const String paymentTypeApi = "paymentTypeApi";
const String stateApi = "stateApi";

List<int> AdditionalDonations = [];

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xff9f53aa), Color(0xff72257d)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class Utilities {
  static String noDataMsg(String moduleName) {
    return 'No $moduleName Found';
  }

  static String searchhintMsg() {
    return 'Please enter atleast 3 letters to search';
  }

  static String searchingMsg() {
    return 'Searching...';
  }

  static String moneyFormatter(double amount) {
    var formatter = NumberFormat("#,##,##0.00");
    String formatAmount = formatter.format(amount);
    return formatAmount;
  }

  static String typeDecider(String urlattachment) {
    String extension = "";
    int j = urlattachment.lastIndexOf('.');
    if (j > 0) {
      extension = urlattachment.substring(j + 1);
    }
    return extension;
  }

  static Future<File> compressImage(File imageToCompress) async {
    EasyLoading.show(status: ConstantVariableClass.loadingString);
    Im.Image? image = Im.decodeImage(imageToCompress.readAsBytesSync());
    EasyLoading.show(status: ConstantVariableClass.loadingString);
    return File(imageToCompress.path)
      ..writeAsBytesSync(Im.encodeJpg(image!, quality: 80));
  }

  static String mobileNumberValidator(
      {required String? phoneCode, required String? phoneNumber}) {
    if (phoneCode != null && phoneNumber != null) {
      return "$phoneCode $phoneNumber";
    } else if (phoneNumber != null) {
      return phoneNumber;
    } else {
      return "-Not added-";
    }
  }

  static String numberFilterForCalling(
      {String? contactNumber, String? contactCode}) {
    if (contactCode != null) {
      return "$contactCode$contactNumber";
    } else {
      return "$contactNumber";
    }
  }

  static String genderValidator({required String? gender}) {
    if (gender != null) {
      if (gender == "M") {
        return "Male";
      } else {
        return "Female";
      }
    } else {
      return "-Not added-";
    }
  }

  static String firstLetterUpperCaseFormatter(String numberInWords) {
    return "${numberInWords[0].toUpperCase()}${numberInWords.substring(1)}";
  }

  static String dateFormatterInputBox({required DateTime? date}) {
    if (date != null) {
      return DateFormat("dd-MM-yyyy").format(date);
    } else {
      return "-Not added-";
    }
  }

  static String dateFormatterForApi({required DateTime date}) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static String dateFormatterForGemsApi({required DateTime date}) {
    return DateFormat("yyyy-M-dd").format(date);
  }

  static String? addressValidatorForGemsApi(
      {required String? address1,
      required String? address2,
      required String? address3}) {
    if (address1 != null && address2 != null && address3 != null) {
      return address1 + " " + address2 + " " + address3;
    } else if (address1 != null && address2 != null) {
      return address1 + " " + address2;
    } else if (address1 != null && address3 != null) {
      return address1 + " " + address3;
    } else {
      return address1;
    }
  }


  static String nameValidatorForGemsApi(
      {required String? firstName,
      required String? middleName,
      required String? lastName}) {
    if (firstName != null && middleName != null && lastName != null) {
      return firstName + " " + middleName + " " + lastName;
    } else if (firstName != null && middleName != null) {
      return firstName + " " + middleName;
    } else if (firstName != null && lastName != null) {
      return firstName + " " + lastName;
    } else {
      return firstName.toString();
    }
  }

  static String dateFormatterView({required String? date}) {
    if (date != null) {
      return DateFormat("dd MMM yyyy").format(DateTime.parse(date));
    } else {
      return "-Not added-";
    }
  }

  static showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static filldetailsToast() {
    Fluttertoast.showToast(
      msg: "Please enter the highlighted fields",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static roleBasedToast(String text) {
    Fluttertoast.showToast(
      msg:
          "You don't have permission to ${text} !. Please contact your Organization",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
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

getcolorText(String status) {
  if (status == "Approved") return Colors.green;
  if (status == "Pending") return Colors.blue;
  if (status == "Rejected") return Colors.red;
}

class ConstantVariableClass {
  static String noResultString = 'Not added';

  static String loadingString = 'Loading';

  static bool dashboardScreenBoolean = false;

  var familyHeadScrollBoolean = ValueNotifier<bool>(true);
}
