import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Colors.dart';
import '../../Helper/size_config.dart';

class CalendarScreen extends StatefulWidget {
  String type ;
  CalendarScreen({Key? key,required this.type}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  DateTime startDate = DateTime.now();

  final calendarController = CleanCalendarController(

    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) async {


      SharedPreferences preferences = await SharedPreferences.getInstance();
      String formattedDate = DateFormat('dd-MM-yyyy').format(firstDate);
      preferences.setString("startDate", formattedDate);

      if(secondDate != null){
        String formattedEndDate = DateFormat('dd-MM-yyyy').format(secondDate);
        preferences.setString("endDate", formattedEndDate);
      }

      print('----date ranged---${firstDate}--${secondDate}');

    },
    onDayTapped: (date) async {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      preferences.setString("singleDate", formattedDate);

      print('----date tapped---${date}');

    },
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // initialFocusDate: DateTime(2023, 5),
    initialDateSelected: DateTime.now(),
    // endDateSelected: DateTime(2022, 3, 20),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Select Travel Date",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: ScrollableCleanCalendar(
                  calendarController: calendarController,
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                  daySelectedBackgroundColorBetween: litblue,
                  daySelectedBackgroundColor: primary_blue)
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 20),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                        color: primary_blue_lte,
                        textColor: primary_blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onPressed: () {
                          Navigator.pop(context,);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 20),
                        child: const Text(
                          'Done',
                          style: TextStyle(fontSize: 16),
                        ),
                        color: primary_blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onPressed: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          String sinleD = preferences.getString("singleDate").toString();
                          if(widget.type == "oneway" && sinleD.isNotEmpty){
                            // Utilities.showToast("Please Select Date");
                          }
                          Navigator.pop(context, );
                        },
                      ),
                    ),
                  )
                ],
              )
          )
        ]
      ),
    );
  }
}
