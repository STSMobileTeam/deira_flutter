

import 'package:deira_flutter/Models/HostCheck.dart';
import 'package:deira_flutter/View/Screens/DummyOneway.dart';
import 'package:deira_flutter/View/Screens/FlightOnewayScreen.dart';
import 'package:deira_flutter/View/Screens/PassengerScreen.dart';
import 'package:deira_flutter/View/Screens/calendarScreen.dart';
import 'package:deira_flutter/View/Screens/homescreen.dart';
import 'package:deira_flutter/View/Screens/login.dart';
import 'package:deira_flutter/View/Screens/paxOperationScreen.dart';
import 'package:deira_flutter/View/bloc/calendarScreenbloc/calendar_bloc.dart';
import 'package:deira_flutter/View/bloc/citysearchbloc/citysearch_bloc.dart';
import 'package:deira_flutter/View/bloc/loginscreenbloc/login_screen_bloc.dart';
import 'package:deira_flutter/View/bloc/onewayscreenbloc/oneway_bloc.dart';
import 'package:deira_flutter/View/bloc/passengerscreenbloc/passenger_bloc.dart';
import 'package:deira_flutter/View/bloc/paxscreenbloc/pax_operation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Helper/CustomPageRoute.dart';
import 'View/Screens/FlightsearchScreen.dart';
import 'View/Screens/citysearch.dart';
import 'View/bloc/flightSearchbloc/flight_search_bloc.dart';
import 'View/bloc/homescreenbloc/home_screen_bloc.dart';

class AppRoutes {

  static const String loginScreen = "Login";
  static const String homeScreen = "HomeView";
  static const String flightSearch = "FlightSearch";
  static const String citysearch = "Citysearch";
  static const String calendarflight = "Calendar";
  static const String oneway = "Oneway";
  static const String dummy = "DummyOne";
  static const String passenger = "Passenger";
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen(settings);
    case AppRoutes.homeScreen:
      return _buildHomeScreen(settings);
    case AppRoutes.flightSearch:
      return _buildFlightSearch(settings);
    case AppRoutes.citysearch:
      return _buildCitySearch(settings);
    // case AppRoutes.calendarflight:
    //   return _buildCalendar(settings);
    case AppRoutes.oneway:
      return _buildOneway(settings);
    case AppRoutes.passenger:
      return _buildPassenger(settings);

  }
  return _buildLoginScreen(settings);
}

Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginScreen(settings));
}

Route<dynamic> _buildHomeScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildHomeScreen(settings));
}

Route<dynamic> _buildFlightSearch(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildFlightSearch(settings));
}

Route<dynamic> _buildCitySearch(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildCitySearch(settings));
}

// Route<dynamic> _buildCalendar(RouteSettings settings) {
//   return CustomPageRoute(child: PageBuilder.buildCalendar(settings));
// }

Route<dynamic> _buildOneway(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildOneway(settings));
}

Route<dynamic> _buildPassenger(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildPassenger(settings));
}


class PageBuilder {
  static Widget buildLoginScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => LoginScreenBloc(),
      child: const MyLogin(),
    );
  }
  static Widget buildHomeScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(),
      child: const HomeView(),
    );
  }
  static Widget buildFlightSearch(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => FlightSearchBloc(),
      child: const FlightSearchScreen(),
    );
  }
  static Widget buildCitySearch(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => CitysearchBloc(),
      child: const CitySearch(),
    );
  }

  static Widget buildPassenger(RouteSettings settings) {
    HostCheckRS hsres = settings.arguments as HostCheckRS;
    return BlocProvider(
      create: (BuildContext context) => PassengerBloc()..add(PassengerInitialEvent()),
      child: PassengerScreen(HSRes: hsres,),
    );
  }

  // static Widget buildCalendar(RouteSettings settings) {
  //   return BlocProvider(
  //     create: (BuildContext context) => CalendarBloc(),
  //     child: const CalendarScreen(),
  //   );
  // }
  static Widget buildOneway(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => OnewayBloc()..add(OnewayInitialEvent()),
      child: const OnewayScreen(),
    );
  }

}