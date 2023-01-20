

import 'package:deira_flutter/View/Screens/homescreen.dart';
import 'package:deira_flutter/View/Screens/login.dart';
import 'package:deira_flutter/View/bloc/loginscreenbloc/login_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Helper/CustomPageRoute.dart';
import 'View/bloc/homescreenbloc/home_screen_bloc.dart';

class AppRoutes {

  static const String loginScreen = "Login";
  static const String homeScreen = "HomeView";

}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen(settings);
    case AppRoutes.homeScreen:
      return _buildHomeScreen(settings);
  }
  return _buildLoginScreen(settings);
}

Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginScreen(settings));
}

Route<dynamic> _buildHomeScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildHomeScreen(settings));
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
}