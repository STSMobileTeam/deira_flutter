

import 'package:deira_flutter/View/Screens/login.dart';
import 'package:deira_flutter/View/bloc/loginscreenbloc/login_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Helper/CustomPageRoute.dart';

class AppRoutes {

  static const String loginScreen = "Login";

}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen(settings);
  }
  return _buildLoginScreen(settings);
}

Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginScreen(settings));
}


class PageBuilder {
  static Widget buildLoginScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => LoginScreenBloc(),
      child: const MyLogin(),
    );
  }
}